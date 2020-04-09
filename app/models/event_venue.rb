class EventVenue < ApplicationRecord
  has_many :events
  validates :name, presence: true
  validates :address, presence: true
  validates :capacity, numericality: {greater_than_or_equal_to: 10, only_integer: true}
end
