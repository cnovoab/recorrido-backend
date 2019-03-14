class Alert < ApplicationRecord
  enum service_stars: %w(premium cama semicama pullman)
  validates :name, presence: true
  validates :departure_city_id, presence: true
  validates :destination_city_id, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
end
