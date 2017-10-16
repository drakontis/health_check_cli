module HealthCheckCli
  module Commands
    class Help < Command
      def execute(opts = {})
        puts 'help             Shows this help message
status           Shows the status of the application and prints the response time
exit             Exits the application.'
      end
    end
  end
end
