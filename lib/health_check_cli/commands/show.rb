module HealthCheckCli
  module Commands
    class Show
      def initialize(app)
        @app = app
      end

      def execute(opts = nil)
        puts "Checking application: #{@app.application_url}"
      end
    end
  end
end
