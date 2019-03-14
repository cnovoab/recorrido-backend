class CreateLookupResults < ActiveRecord::Migration[5.2]
  def change
    create_table :lookup_results do |t|
      t.integer :lookup_id, null: false
      t.timestamp :departure_date, null: false
      t.float :price, null: false
      t.integer :bus_operator_id
      t.string :bus_operator

      t.timestamps

      t.references :lookup, foreign_key: true
    end
  end
end
