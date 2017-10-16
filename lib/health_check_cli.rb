require "health_check_cli/version"
require "health_check_cli/commands"

module HealthCheckCli
  class Prompt
    attr_accessor :application_url

    def initialize(application_url = 'https://gitlab.com')
      @application_url = application_url
    end

    PROMPT = "> "

    def run
      @live = true
      puts 'Type `help` for instructions on usage'

      while @live
        begin
          print PROMPT
          args = gets.chomp.split(' ')
          cmd = HealthCheckCli::Commands.find(args.shift, self)
          cmd.execute(args)
        rescue HealthCheckCli::Commands::Error => e
          print "#{e.message}\n"
        end
      end
    end

    def stop
      puts 'Thank you for using health check cli'
      @live = false
    end
  end
end
