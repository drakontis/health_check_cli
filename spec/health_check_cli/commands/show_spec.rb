require 'spec_helper'

RSpec.describe HealthCheckCli::Commands::Show do
  describe '#initialize' do
    it 'should initialize the command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Show.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Show
      expect(exit_command.app).to eq app
      expect(exit_command).to respond_to :execute
    end

    it 'should derive from Command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Show.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Command
    end
  end

  describe '#execute' do
    it 'should show the current application' do
      application_url = 'http://www.drakontis.com'
      app = HealthCheckCli::Prompt.new(application_url)
      command = HealthCheckCli::Commands::Show.new(app)

      expect(app.application_url).to eq application_url

      expect{ command.execute }.to output("Checking application: #{application_url}\n").to_stdout
    end
  end
end
