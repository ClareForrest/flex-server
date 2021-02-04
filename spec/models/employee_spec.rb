require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { FactoryBot.build(:employee) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without availability' do
      subject.availability = nil
      expect(subject).to_not be_valid
    end
  end
end