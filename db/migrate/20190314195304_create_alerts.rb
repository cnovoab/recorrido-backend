class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.string :name, null: false
      t.integer :departure_city_id, null: false
      t.integer :destination_city_id, null: false
      t.integer :user_id, null: false
      t.float :price, null: false
      t.integer :service_stars
      t.boolean :active, default: :true, null: false

      t.timestamps
    end
  end
end
