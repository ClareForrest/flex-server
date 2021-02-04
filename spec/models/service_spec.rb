require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { FactoryBot.build(:service) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a cost' do 
      subject.cost = nil
      expect(subject).to_not be_valid
    end
  end
end