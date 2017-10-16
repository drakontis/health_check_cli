require 'health_check_cli/commands/command'
require 'health_check_cli/commands/exit'
require 'health_check_cli/commands/help'
require 'health_check_cli/commands/status'

module HealthCheckCli
  module Commands
    CMD_HELP = "help"
    CMD_EXIT = "exit"
    CMD_STATUS = "status"

    class Error < RuntimeError
      attr_reader :message

      def initialize(msg)
        @message = msg
      end
    end

    def find(cmd, app)
      case cmd
        when CMD_HELP then Help.new(app)
        when CMD_EXIT then Exit.new(app)
        when CMD_STATUS then Status.new(app)
        else Command.new(app)
      end
    end

    extend self
  end
end
