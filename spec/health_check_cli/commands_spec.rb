require 'spec_helper'

RSpec.describe HealthCheckCli::Commands do
  describe '#error' do
    it 'should initialize the error' do
      message = 'Error Message'
      command = HealthCheckCli::Commands::Error.new(message)

      expect(command).to be_a HealthCheckCli::Commands::Error
      expect(command.message).to eq message
    end
  end

  describe '#find' do
    let(:app){ HealthCheckCli::Prompt.new('http://www.drakontis.com') }

    context 'when cmd is help' do
      it 'should create a new help command' do
        command = HealthCheckCli::Commands.find('help', app)

        expect(command).to be_a HealthCheckCli::Commands::Help
        expect(command.app).to eq app
      end
    end

    context 'when cmd is exit' do
      it 'should create a new exit command' do
        command = HealthCheckCli::Commands.find('exit', app)

        expect(command).to be_a HealthCheckCli::Commands::Exit
        expect(command.app).to eq app
      end
    end

    context 'when cmd is status' do
      it 'should create a new status command' do
        command = HealthCheckCli::Commands.find('status', app)

        expect(command).to be_a HealthCheckCli::Commands::Status
        expect(command.app).to eq app
      end
    end

    context 'when cmd is init' do
      it 'should create a new init command' do
        command = HealthCheckCli::Commands.find('init', app)

        expect(command).to be_a HealthCheckCli::Commands::Init
        expect(command.app).to eq app
      end
    end

    context 'when cmd is show' do
      it 'should create a new show command' do
        command = HealthCheckCli::Commands.find('show', app)

        expect(command).to be_a HealthCheckCli::Commands::Show
        expect(command.app).to eq app
      end
    end

    context 'when cmd is not in the commands list' do
      it 'should create a new show command' do
        command = HealthCheckCli::Commands.find('show', app)

        expect(command).to be_a HealthCheckCli::Commands::Command
        expect(command.app).to eq app
      end
    end
  end
end
