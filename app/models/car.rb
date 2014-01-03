class Car <ActiveRecord::Base
  validates :year, 
    presence: { message: 'Year must be supplied' },
    numericality: { greater_than_or_equal_to: 1980, message: 'Model year not allowed. Year must be 1980 or later.' }

  validates :color,
    presence: { message: 'Color must be supplied' }

  validates :mileage,
    presence: { message: 'Mileage must be supplied' },
    numericality: {integer: true, message: 'Please input a whole number'}

end