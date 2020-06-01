module FrCable
  module Channel
    class Base

      attr_reader :params, :broadcasted_room

      def self.broadcast(room, message)
        ::FrCable::HTTPClient.post(::FrCable::Rack.config[:socket_server_url], body: {type: "message", payload: {room: room, message: message}}.to_json)
      end

      def broadcast(room, message)
        ::FrCable::Channel::Base.broadcast("#{self.class.name}:#{room}", message)
      end

      def initialize _params
        @params = _params
        @broadcasted_room = nil
      end

      def receive message
        # void
      end

      def subscribed connection_uuid
        true
      end

      def unsubscribed
        # void
      end
    end
  end
end