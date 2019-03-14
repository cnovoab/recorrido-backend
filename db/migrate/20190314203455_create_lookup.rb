class CreateLookup < ActiveRecord::Migration[5.2]
  def change
    create_table :lookups do |t|
      t.integer :alert_id, null: false
      t.timestamp :search_date, null: false
      t.float :min_price

      t.timestamps

      t.references :alert, foreign_key: true
    end
  end
end
