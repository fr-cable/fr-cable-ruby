module FrCable
  class HttpHandler

    def channel_class(room)
      @channel_class ||= {}
      @channel_class[room] ||= begin
        splited_room_name = room.split(":")
        splited_room_name[0].constantize.new({room: splited_room_name[1]})
      end
      @channel_class[room]
    end

    def connection_class
      @connection_class ||= ::ApplicationCable::Connection.new
    end

    def message payload
      connection_uuid = payload["connection_uuid"]
      room = payload["room"]
      message = payload["message"]
      
      channel_class(room).receive(message)
    end

    def subscribe payload
      connection_uuid = payload["connection"]
      room = payload["room"]
      uuid = payload["subscription"]

      result = channel_class(room).subscribed(connection_uuid)
      if result
        ::FrCable::HTTPClient.post(::FrCable::Rack.config[:socket_server_url], body: {type: 'accept_subscription', payload: uuid}.to_json)
      else
        ::FrCable::HTTPClient.post(::FrCable::Rack.config[:socket_server_url], body: {type: 'deny_subscription', payload: uuid}.to_json)
      end
    end

    def unsubscribe payload
      connection_uuid = payload[:connection_uuid]
      room = payload[:room]
      uuid = payload[:uuid]

      channel_class(room).unsubscribed(connection_uuid)
    
    end

    def connect connection_uuid
      result = connection_class.connected(connection_uuid)
      if result
        ::FrCable::HTTPClient.post(::FrCable::Rack.config[:socket_server_url], body: {type: 'accept_connection', payload: connection_uuid}.to_json)
      else
        ::FrCable::HTTPClient.post(::FrCable::Rack.config[:socket_server_url], body: {type: 'deny_connection', payload: connection_uuid}.to_json)
      end
    end

    def disconnect connection_uuid
      connection_class.disconnected(connection_uuid)
    end
  end
end