class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings
  scope :unique_departure_times, -> { pluck(:departure).map { |a| a.strftime('%B %d, %Y') }.uniq }
  # scope :unique_departure_times, -> { pluck(:departure).uniq }
end
