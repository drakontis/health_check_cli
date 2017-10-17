require 'spec_helper'

RSpec.describe HealthCheckCli::Commands::Command do
  describe '#initialize' do
    it 'should initialize the command' do
      app = double('App')
      command = HealthCheckCli::Commands::Command.new(app)

      expect(command).to be_a HealthCheckCli::Commands::Command
      expect(command.app).to eq app
      expect(command).to respond_to :execute
    end
  end

  describe '#execute' do
    it 'should print command not found' do
      app = double('App')
      command = HealthCheckCli::Commands::Command.new(app)

      expect { command.execute }.to output("Command not found. Type `help` for instructions on usage\n").to_stdout
    end
  end
end
