class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :country_id, null: false
      t.string :url_name, null: false
      t.float :latitude
      t.float :longitude
      t.string :url

      t.timestamps
    end
  end
end
