class CreateBookings < ActiveRecord::Migration[5.0]
  def change
     create_table :bookings do |t|
      t.references :flight, foriegn_key: true
      t.references :user, foreign_key: true
    end
  end
end