Airport.delete_all
Flight.delete_all

Airport.create!(name: "London Heathrow", code: "LHR")
Airport.create!(name: "John Kennedy New York", code: "JFK")
Airport.create!(name: "Dong Muang Airport Bangkok", code: "DMK")
Airport.create!(name: "Orlando Melbourne Airport", code: "MLB")
Airport.create!(name: "Beijing Capital International", code: "PEK")
Airport.create!(name: "Haneda Airport Tokyo", code: "HND")
Airport.create!(name: "Los Angeles International", code: "LAX")
Airport.create!(name: "Dubai International Airport", code: "DXB")
Airport.create!(name: "Amsterdam Airport", code: "AMS")
Airport.create!(name: "Istanbul International Airport", code: "IST")


airports = Airport.all

4.times do #4 flights a day
  day = 1
  21.times do #3 weekss worth of flights
    airports.each do |departing|
      airports.each do |arriving|
        duration = rand(10000..120000)
        date = Faker::Time.between((DateTime.now + day), (DateTime.now + day)) 
        unless departing == arriving
          Flight.create!(name: "#{departing.code}-#{arriving.code}", departing_airport_id: departing.id, arriving_airport_id: arriving.id, time: date, duration: duration)
        end
      end
    end
    day += 1
  end
end