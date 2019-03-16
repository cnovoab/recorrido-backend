class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :lookup_id, null: false
      t.integer :resource_id
      t.timestamp :search_date, null: false
      t.string :status

      t.timestamps

      t.references :lookup, foreign_key: true
    end
  end
end
