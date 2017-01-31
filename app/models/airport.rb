class Airport < ApplicationRecord
    has_many :outbound_flights, foreign_key: :departing_airport, class_name: "Flight"
    has_many :inbound_flights, foreign_key: :arriving_airport, class_name: "Flight"
end
