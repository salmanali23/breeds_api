# spec/controllers/api/v1/breeds_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::BreedsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns breeds as JSON' do
      create_list(:breed, 3)
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(3)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { breed: { name: 'Labrador' } } }
    let(:invalid_attributes) { { breed: { name: '' } } }

    context 'with valid parameters' do
      it 'creates a new breed' do
        expect {
          post :create, params: valid_attributes
        }.to change(Breed, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new breed' do
        expect {
          post :create, params: invalid_attributes
        }.to_not change(Breed, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
