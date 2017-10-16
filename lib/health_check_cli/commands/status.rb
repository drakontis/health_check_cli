require 'net/http'
require 'uri'

module HealthCheckCli
  module Commands
    class Status < Command

      def execute(opts = nil)
        begin
          puts "Application url: #{@app.application_url}"
          puts '-----------------------------------------'

          url = URI.parse(@app.application_url)
          start_time = Time.now
          response = Net::HTTP.get(url)
          @response_time = Time.now - start_time

          if response == ""
            puts "The application is Down"
          else
            puts "The application is Up. Response time: #{@response_time}s"
          end
        rescue StandardError => ex
          puts ex.message
        end
      end

    end
  end
end
