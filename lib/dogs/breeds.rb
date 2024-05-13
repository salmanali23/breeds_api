module Dogs
  class Breeds < Client
    def fetch_image(breed)
      response = get("/breed/#{breed}/images")
      response ? response['message']: nil
    end
  end
end
