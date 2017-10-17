require 'spec_helper'

RSpec.describe HealthCheckCli::Commands::Exit do
  describe '#initialize' do
    it 'should initialize the command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Exit.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Exit
      expect(exit_command.app).to eq app
      expect(exit_command).to respond_to :execute
    end

    it 'should derive from Command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Exit.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Command
    end
  end

  describe '#execute' do
    it 'should stop the application' do
      app = HealthCheckCli::Prompt.new
      command = HealthCheckCli::Commands::Exit.new(app)

      expect(app).to receive(:stop)

      command.execute
    end
  end
end
