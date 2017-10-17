require "spec_helper"

RSpec.describe HealthCheckCli do
  let(:prompt){ HealthCheckCli::Prompt.new }
  let(:exit_command){ "exit\n" }

  describe 'init' do
    let(:init_argument){ 'http://www.drakontis.com' }
    let(:init_command){ "init #{init_argument}\n" }

    before { allow(prompt).to receive_message_chain(:gets, :chomp).and_return init_command, exit_command }

    it 'should execute the command' do
      prompt.run
      expect(prompt.application_url).to eq init_argument
    end
  end

  describe 'help' do
    let(:help_command){ "help\n" }

    before { allow(prompt).to receive_message_chain(:gets, :chomp).and_return help_command, exit_command }

    it 'should execute the command' do
      output = "Type `help` for instructions on usage\n> help             Shows this help message.\ninit             (Re)Initialises the application with a new endpoint.\nshow             Shows the current application that is under health check.\nstatus           Shows the status of the application and prints the response time.\nexit             Exits the application.\n> Thank you for using health check cli\n"

      expect { prompt.run }.to output(output).to_stdout
    end
  end

  describe 'show' do
    let(:show_command){ "show\n" }

    before { allow(prompt).to receive_message_chain(:gets, :chomp).and_return show_command, exit_command }

    it 'should execute the command' do
      output = "Type `help` for instructions on usage\n> Checking application: #{prompt.application_url}\n> Thank you for using health check cli\n"

      expect { prompt.run }.to output(output).to_stdout
    end
  end

  describe 'status' do
    let(:status_command){ "status\n" }
    let(:start_time){ Time.now }
    let(:end_time){ Time.now + 1 }
    let(:get_response){ 'Response' }

    before do
      allow(prompt).to receive_message_chain(:gets, :chomp).and_return status_command, exit_command
      allow(Time).to receive(:now).and_return(start_time, end_time)
      allow(Net::HTTP).to receive(:get).and_return get_response
    end

    it 'should execute the command' do
      output = "Type `help` for instructions on usage\n> Application url: #{prompt.application_url}\n-----------------------------------------\nThe application is Up. Response time: #{end_time - start_time}s\n> Thank you for using health check cli\n"

      expect { prompt.run }.to output(output).to_stdout
    end
  end
end