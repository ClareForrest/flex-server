require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject { FactoryBot.build(:booking) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a time' do
      subject.time = nil
      expect(subject).to_not be_valid
    end
  end
end