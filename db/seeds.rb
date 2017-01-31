Airport.create!(name: "San Francisco", code: "SFO")
Airport.create!(name: "New York", code: "JFK")

5.times do |x|
   Flight.create!(name: "SFO-NYC-#{x}", departing_airport_id: 1, arriving_airport_id: 2, 
                                    duration: 20000, time: (Time.now + x*2.hours) )
end