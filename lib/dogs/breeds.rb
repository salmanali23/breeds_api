module Dogs
  class Breeds < Client
    def fetch_image(breed)
      response = get("/breed/#{breed}/images")
      response ? response['message']&.sample : "https://www.freeiconspng.com/uploads/no-image-icon-6.png"
    end
  end
end
