require 'spec_helper'

describe 'a user records a newly acquired car', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  # ACCEPTANCE CRITERIA
  # * I must specify the color, mileage, and year of the car
  # * Only years from 1980 and above can be specified
  # * I can optionally specify a description of the car
  # * Car is recorded if required information is provided
  # * Care is not recorded if required information is not provided
  # * Upon successful completion, I am re-directed to create another car

  context 'required information is provided (happy path)' do
    it 'creates a new car record' do

      car = FactoryGirl.create(:car)

      visit new_car_path
      fill_in 'Color', with: car.color
      fill_in 'Mileage', with: car.mileage
      fill_in 'Year', with: car.year
      click_on 'Create new Car record'

      expect(page).to have_content 'Congratulations.  Your car has been saved'
      expect(page).to have_content 'Color'
      expect(page).to have_content 'Mileage'
      expect(page).to have_content 'Year'

    end
  end

  context 'invalid information is provided (wrong car year)' do
    it 'throws an error when year is earlier than 1980' do

      car = FactoryGirl.create(:car)

      visit new_car_path
      fill_in 'Color', with: car.color
      fill_in 'Mileage', with: car.mileage
      fill_in 'Year', with: 1979
      click_on 'Create new Car record'

      expect(page).to have_content 'Model year not allowed. Year must be 1980 or later.'
      expect(page).to_not have_content 'Congratulations.  Your car has been saved!'

    end
  end

end