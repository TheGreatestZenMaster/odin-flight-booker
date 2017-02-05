class Flight < ApplicationRecord
  belongs_to :departing_airport, class_name: "Airport"
  belongs_to :arriving_airport, class_name: "Airport"
  has_many :bookings, foreign_key: :flight_id
  has_many :passengers, through: :bookings
  accepts_nested_attributes_for :bookings
  
  def event_date_text
      time.strftime("%d/%m/%Y")
  end
end
