require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a unique password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a unique phone number' do
      subject.phone_number = nil
      expect(subject).to_not be_valid
    end
  end
end
