class Car <ActiveRecord::Base
  validates :year, 
    presence: true,
    numericality: { greater_than_or_equal_to: 1980, message: 'Model year not allowed. Year must be 1980 or later.' }
end