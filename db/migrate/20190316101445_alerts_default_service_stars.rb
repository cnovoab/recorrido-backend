class AlertsDefaultServiceStars < ActiveRecord::Migration[5.2]
  def up
    change_column :alerts, :service_stars, :integer, default: 0, null: false
  end

  def down
    change_column :alerts, :service_stars, :integer, null: true
  end
end
