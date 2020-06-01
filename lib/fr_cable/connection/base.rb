module FrCable
  module Connection
    class Base
      def initialize

      end

      def connected connection_uuid
        true
      end

      def disconnected connection_uuid
        # void
      end
    end
  end

end