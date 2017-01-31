class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :name
      t.datetime :departing_time
      t.integer :duration

      t.timestamps
    end
  end
end
