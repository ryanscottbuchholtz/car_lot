require 'spec_helper'

describe Car do
  describe 'validations' do
    let(:car) {FactoryGirl.build(:car) }
    let(:blank) { ['', nil] }

    it 'is valid when it has all required and valid attributes' do
      expect(car).to be_valid
    end

    it { should_not have_valid(:color).when(*blank) }
    it { should_not have_valid(:year).when(*blank, 1965, 81) }
    it { should_not have_valid(:mileage).when(*blank) }
    it { should have_valid(:description).when(*blank, 'This is the description') }

  end
end
