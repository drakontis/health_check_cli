module HealthCheckCli
  module Commands
    class Command
      attr_accessor :app

      def initialize(app)
        @app = app
      end

      def execute(opts = nil)
        puts 'Command not found. Type `help` for instructions on usage'
      end
    end
  end
end
