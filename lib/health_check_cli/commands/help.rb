module HealthCheckCli
  module Commands
    class Help < Command
      def execute(opts = {})
        puts 'help             Shows this help message.
init             (Re)Initialises the application with a new endpoint.
show             Shows the current application that is under health check.
status           Shows the status of the application and prints the response time.
exit             Exits the application.'
      end
    end
  end
end
