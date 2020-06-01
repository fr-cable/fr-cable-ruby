module FrCable

  class Rack

    def initialize app
      @app = app
      @http_handler = ::FrCable::HttpHandler.new
    end

    def self.config
      @config = {
        socket_server_url: 'http://localhost:3015/http'
      }
    end

    def call(env) 
      if env["REQUEST_PATH"] == "/fr_cable_connection" && env["REQUEST_METHOD"] == "POST"
        hash = env['rack.input'].read
        params = JSON.parse hash
        @http_handler.send(params["type"], params["payload"])
        [200, {}, params.to_json]
      else
        @status, @headers, @response = @app.call(env)
        [@status, @headers, @response]
      end
    end
  end
end

