require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { FactoryBot.build(:address) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a street' do
      subject.street = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a suburb' do
      subject.suburb = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a state' do
      subject.state = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a postcode' do
      subject.postcode = nil
      expect(subject).to_not be_valid
    end
  end
end