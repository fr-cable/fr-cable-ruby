module FrCable
  class HTTPClient
    def self.post url, params
      body = params[:body]
      header = { 'Content-Type' => 'application/json',
        'Accept' => 'application/json' }
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new(uri.path, header)
      req.body = body
      http.request(req)
    end
  end
end