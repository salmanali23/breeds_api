# spec/models/breed_spec.rb
require 'rails_helper'

RSpec.describe Breed, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }

    it 'validates uniqueness of name (case-insensitive)' do
      existing_breed = FactoryBot.create(:breed, name: 'Test Breed')
      breed = FactoryBot.build(:breed, name: 'test breed')
      expect(breed).not_to be_valid
      expect(breed.errors[:name]).to include('has already been taken')
    end
  end
end
