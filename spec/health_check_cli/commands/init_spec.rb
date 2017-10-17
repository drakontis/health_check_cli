require 'spec_helper'

RSpec.describe HealthCheckCli::Commands::Init do
  describe '#initialize' do
    it 'should initialize the command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Init.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Init
      expect(exit_command.app).to eq app
      expect(exit_command).to respond_to :execute
    end

    it 'should derive from Command' do
      app = HealthCheckCli::Prompt.new
      exit_command = HealthCheckCli::Commands::Init.new(app)

      expect(exit_command).to be_a HealthCheckCli::Commands::Command
    end
  end

  describe '#execute' do
    it 'should re initialize the application' do
      app = HealthCheckCli::Prompt.new
      command = HealthCheckCli::Commands::Init.new(app)

      expect(app.application_url).to eq 'https://gitlab.com'

      new_application_url = 'http://www.drakontis.com'

      command.execute([new_application_url])

      expect(app.application_url).to eq new_application_url
    end
  end
end
