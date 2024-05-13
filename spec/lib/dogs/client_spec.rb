require 'rails_helper'
require 'dogs/client'

RSpec.describe Dogs::Client do
  let(:client) { described_class.new }

  describe '#get' do
    context 'when the request is successful' do
      let(:response_body) { { 'message' => ['image1.jpg', 'image2.jpg'] } }

      before do
        allow(Faraday).to receive(:new).and_return(double(get: double(body: response_body.to_json, success?: true)))
      end

      it 'returns parsed JSON response' do
        response = client.get('/breed/hound/images')
        expect(response).to eq(response_body)
      end
    end

    context 'when the request fails' do
      before do
        allow(Faraday).to receive(:new).and_return(double(get: double(success?: false, status: 404)))
      end

      it 'calls handle_error method' do
        expect(client).to receive(:handle_error).with(404)
        client.get('/invalid/endpoint')
      end
    end
  end
end
