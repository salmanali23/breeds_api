require 'rails_helper'
require 'dogs/breeds'

RSpec.describe Dogs::Breeds do
  let(:breeds_client) { described_class.new }

  describe '#fetch_image' do
    context 'when the request is successful' do
      let(:breed) { 'hound' }
      let(:response_body) { { 'message' => ['image1.jpg', 'image2.jpg'] } }

      before do
        allow(Faraday).to receive(:new).and_return(double(get: double(body: response_body.to_json, success?: true)))
      end

      it 'returns an array of image URLs' do
        images = breeds_client.fetch_image(breed)
        expect(images).to eq(response_body['message'])
      end
    end

    context 'when the request fails' do
      let(:breed) { 'invalid_breed' }

      before do
        allow(Faraday).to receive(:new).and_return(double(get: double(success?: false, status: 404)))
      end

      it 'calls handle_error method' do
        expect(breeds_client).to receive(:handle_error).with(404)
        breeds_client.fetch_image(breed)
      end
    end
  end
end
