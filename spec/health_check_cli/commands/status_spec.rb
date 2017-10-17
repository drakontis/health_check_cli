require 'spec_helper'

RSpec.describe HealthCheckCli::Commands::Status do
  describe '#initialize' do
    it 'should initialize the command' do
      app = HealthCheckCli::Prompt.new
      status_command = HealthCheckCli::Commands::Status.new(app)

      expect(status_command).to be_a HealthCheckCli::Commands::Status
      expect(status_command.app).to eq app
      expect(status_command).to respond_to :execute
    end

    it 'should derive from Command' do
      app = HealthCheckCli::Prompt.new
      status_command = HealthCheckCli::Commands::Status.new(app)

      expect(status_command).to be_a HealthCheckCli::Commands::Command
    end
  end

  describe '#execute' do
    let(:start_time){ Time.now }
    let(:end_time){ Time.now + 1 }
    let(:subject) do
      app = HealthCheckCli::Prompt.new
      HealthCheckCli::Commands::Status.new(app)
    end

    before { allow(Time).to receive(:now).and_return(start_time, end_time) }

    context 'with not empty response' do
      let(:get_response){ 'Response' }

      before { allow(Net::HTTP).to receive(:get).and_return get_response }

      it 'should print the results' do
        output = "Application url: #{subject.app.application_url}\n-----------------------------------------\nThe application is Up. Response time: #{end_time-start_time}s\n"

        expect{ subject.execute }.to output(output).to_stdout
      end
    end

    context 'with empty response' do
      let(:get_response){ '' }

      before { allow(Net::HTTP).to receive(:get).and_return get_response }

      it 'should print the results' do
        output = "Application url: #{subject.app.application_url}\n-----------------------------------------\nThe application is Down\n"

        expect{ subject.execute }.to output(output).to_stdout
      end
    end

    context 'with exception' do
      before { allow(Net::HTTP).to receive(:get).and_raise StandardError.new('AnErrorMessage') }

      it 'should print the results' do
        output = "Application url: #{subject.app.application_url}\n-----------------------------------------\nAnErrorMessage\n"

        expect{ subject.execute }.to output(output).to_stdout
      end
    end
  end
end