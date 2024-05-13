class Api::V1::BreedsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: :create

  def index
    @breeds = Breed.all
    render json: @breeds
  end

  def create
    @breed = Breed.new(breed_params)
    @breed.image_url = fetch_breed_image
    @breed.save!
    render json: @breed
  end

  private

  def breed_params
    params.require(:breed).permit(:name)
  end

  def fetch_breed_image
    client = Dogs::Breeds.new
    client.fetch_image(breed_params[:name])
  end
end
