require 'health_check_cli/commands/command'
require 'health_check_cli/commands/exit'
require 'health_check_cli/commands/help'
require 'health_check_cli/commands/status'
require 'health_check_cli/commands/init'
require 'health_check_cli/commands/show'

module HealthCheckCli
  module Commands
    class Error < RuntimeError
      attr_reader :message

      def initialize(msg)
        @message = msg
      end
    end

    def find(cmd, app)
      case cmd
        when 'help' then Help.new(app)
        when 'exit' then Exit.new(app)
        when 'status' then Status.new(app)
        when 'init' then Init.new(app)
        when 'show' then Show.new(app)
        else Command.new(app)
      end
    end

    extend self
  end
end
