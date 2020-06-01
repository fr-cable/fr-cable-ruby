# FrCable ruby

It's http rake based middleware server impementation for fr-cable-server.

`!!!WARNING!!!` The project is at a very early stage of development, it can be used, but there is no guarantee that it works as you expect and that I will not abandon it tomorrow

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fr_cable'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install fr_cable

Add this line into you `config/application.rb`

```
config.middleware.use FrCable::Rack
```

Then touch `app/channels/application_cable/channel.rb, that contain`
```
class ApplicationCable::Channel < FrCable::Channel::Base

end
```

and `app/channels/application_cable/connection.rb`

```
class ApplicationCable::Connection < FrCable::Connection::Base

end
```


## Usage

You can define channels like in action_cable gem.

`app/channels/comment_channel.rb`

```
class OrderChannel < ApplicationCable::Channel
  def receive message
    broadcast(params[:room], message)
  end
end
```

Run fr-cable-server dockerfile near of you app and you already can messaging through fr-cable-js-client npm package.

## Contributing

No needed to contribute now

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).