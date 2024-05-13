module Dogs
  class Breeds < Client
    def fetch_image(breed)
      get("/breed/#{breed}/images")['message']
    end
  end
end
