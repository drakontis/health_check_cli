module HealthCheckCli
  module Commands
    class Init
      def initialize(app)
        @app = app
      end

      def execute(opts = [])
        application_url = opts.shift
        raise Commands::Error, "No application provided" unless application_url

        @app.application_url = application_url
      end
    end
  end
end
