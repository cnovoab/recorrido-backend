class CreateBusTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_travels do |t|
      t.integer :search_id, null: false
      t.timestamp :departure_date, null: false
      t.integer :service_stars, null: false
      t.integer :search_id
      t.float :price, null: false
      t.integer :bus_operator_id
      t.string :bus_operator

      t.timestamps

      t.references :search, foreign_key: true
    end
  end
end
