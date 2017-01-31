class AddForeignKeysToFlights < ActiveRecord::Migration[5.0]
  def change
    change_table :flights do |t|
      t.references :departing_airport, references: :airport
      t.references :arriving_airport, references: :airport
    end
  end
end
