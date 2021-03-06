require 'spec_helper'

RSpec.describe HealthCheckCli::Commands::Help do
  describe '#initialize' do
    it 'should initialize the command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Help.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Help
      expect(exit_command.app).to eq app
      expect(exit_command).to respond_to :execute
    end

    it 'should derive from Command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Help.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Command
    end
  end

  describe '#execute' do
    it 'should print the manual' do
      app = double('App')
      command = HealthCheckCli::Commands::Help.new(app)

      output = "help             Displays this help message.\ninit             Reinitialises the health_check_cli application with a new endpoint. Example: init http://www.drakontis.com\nshow             Displays the current application that is under health check.\nstatus           Displays the status of the current application that is under health check and prints its response time.\nexit             Exits the application.\n"

      expect { command.execute }.to output(output).to_stdout
    end
  end
end
