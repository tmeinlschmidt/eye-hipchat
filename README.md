# Eye::Hipchat

Sends info about process crashes to hipchat room.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eye'
gem 'eye-hipchat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eye-hipchat

## Usage

this is an example configuration file

````
# Notify example
require 'eye/notify/hipchat'

Eye.config do
  hipchat token: 'hipchat_v1_token', message: '<strong>#name#</strong> (#pid#) on #host# #message# at #time#.'
  contact :dev, :hipchat, 'test'
  logger '/tmp/eye.log'
end

Eye.application 'test' do
  notify :dev, :debug
  stdall '/tmp/eye-example.log'

  process :some_process do
    notify :dev, :debug
    start_command 'sleep 120'
    daemonize true
    pid_file '/tmp/sleep.pid'
  end

end
````

# Configuration

* add `hipchat` line to `Eye.config` section and check following parameters
 * `token` - *required* - v1/v2 token
 * `api` - use *v1* (default) or v2
 * `name` - who is reporting to hipchat, *Eye Bot* as a default
 * `color` - *yellow* is default. You can choose from gray, green, purple, red, yellow or random
 * `notify_all` - notify everyone in the room. Default is *false*
 * `format` - format of the message. Either `html` or `text`. Default is *html*
 * `message` - message to be sent, default is `<strong>#name#</strong> on #host# #message# at #time#.`

* `message` has following variables (variable must be enclosed to ##)
 * `time` - human readable time of the event
 * `host` - hostname
 * `message` - full message
 * `name` - name of process
 * `full_name` - full process name (like group::process)
 * `pid` - process ID
 * `level` - message info level

## Contributing

1. Fork it ( https://github.com/[my-github-username]/eye-hipchat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
