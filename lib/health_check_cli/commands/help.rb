module HealthCheckCli
  module Commands
    class Help < Command
      def execute(opts = {})
        puts 'help             Displays this help message.
init             Reinitialises the health_check_cli application with a new endpoint. Example: init http://www.drakontis.com
show             Displays the current application that is under health check.
status           Displays the status of the current application that is under health check and prints its response time.
exit             Exits the application.'
      end
    end
  end
end
