class Booking < ApplicationRecord
    has_many :passengers
    belongs_to :flight
    belongs_to :user
    accepts_nested_attributes_for :passengers
end