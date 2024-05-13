require 'faraday'

module Dogs
  class Client
    BASE_URL = 'https://dog.ceo/api'

    def initialize
      @connection = Faraday.new(BASE_URL) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get(path)
      response = @connection.get("#{BASE_URL}#{path}")
      handle_response(response)
    rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
      handle_error(e)
    end

    private

    def handle_response(response)
      if response.success?
        JSON.parse(response.body)
      else
        handle_error(response.status)
      end
    end

    def handle_error(error)
      puts "Error occurred: #{error}"
    end
  end
end
