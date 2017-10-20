# HealthCheckCli

This is a simple CLI tool that displays the status of a given application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'health_check_cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install health_check_cli

## Usage

To start using the health check CLI gem, type in you terminal: 
```
health_check_cli
```

The default application to be checked is 'https://gitlab.com'

Currently, in the prompt you can give the following commands:
* help: This command prints the application's manual.
* init: Reinitializes the application with a new endpoint.
* show: Displays the application that is under health check.
* status: Displays the status of the given application and prints the response time.
* exit: Exits the application

I would like some time in the future to extend the gem's functionality. :)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drakontis/health_check_cli.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
