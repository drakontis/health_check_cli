require 'spec_helper'

RSpec.describe HealthCheckCli::Commands::Status do
  describe '#initialize' do
    it 'should initialize the command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Status.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Status
      expect(exit_command.app).to eq app
      expect(exit_command).to respond_to :execute
    end

    it 'should derive from Command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Status.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Command
    end
  end

  describe '#execute' do
    pending
  end
end
