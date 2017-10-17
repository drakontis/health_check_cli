require "spec_helper"

RSpec.describe HealthCheckCli do
  it "has a version number" do
    expect(HealthCheckCli::VERSION).not_to be nil
  end

  describe '#initialize' do
    let(:application_url) { 'http://www.drakontis.com' }

    it 'should initialize a new prompt' do
      prompt = HealthCheckCli::Prompt.new(application_url)

      expect(prompt).to be_a HealthCheckCli::Prompt
      expect(prompt.application_url).to eq application_url
    end
  end

  describe '#stop' do
    let(:application_url) { 'http://www.drakontis.com' }

    it 'should stop the application' do
      prompt = HealthCheckCli::Prompt.new(application_url)

      prompt.stop

      expect(prompt.live).to be_falsey
    end
  end

  describe '#run' do
    let(:application_url) { 'http://www.drakontis.com' }
    let(:prompt){ HealthCheckCli::Prompt.new(application_url) }
    let(:init_argument){ 'http://www.drakontis.com' }
    let(:init_command){ "init #{init_argument}\n" }
    let(:exit_command){ "exit\n" }

    before { allow(prompt).to receive_message_chain(:gets, :chomp).and_return init_command, exit_command }

    it 'should print the welcome message' do
      expect{prompt.run}.to output("Type `help` for instructions on usage\n> > Thank you for using health check cli\n").to_stdout
    end

    it 'should execute the command' do
      command = double('Command')

      expect(HealthCheckCli::Commands).to receive(:find).with('init', prompt).once.and_return command
      expect(command).to receive(:execute)

      expect(HealthCheckCli::Commands).to receive(:find).with('exit', prompt).once.and_return HealthCheckCli::Commands::Exit.new(prompt)

      prompt.run
    end

    context 'Error' do
      let(:init_argument){ '' }

      it 'should print the error' do
        expect{prompt.run}.to output("Type `help` for instructions on usage\n> No application provided\n> Thank you for using health check cli\n").to_stdout
      end
    end
  end
end
