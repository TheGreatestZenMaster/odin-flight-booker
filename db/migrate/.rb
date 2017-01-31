class FixFlightColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :flights, :departing_airport_id_id, :departing_airport_id
    rename_column :flights, :arriving_airport_id_id, :arriving_airport_id
  end
end
