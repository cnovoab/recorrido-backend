class Alert < ApplicationRecord
  enum service_stars: { any: 0, premium: 1, cama: 2, semicama: 3, pullman: 4 }
  validates :name, presence: true
  validates :departure_city_id, presence: true
  validates :destination_city_id, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
  attribute :service_stars, :integer, default: 0

  has_many :lookups
  belongs_to :user
  belongs_to :departure_city, class_name: 'City'
  belongs_to :destination_city, class_name: 'City'

  scope :actives, -> { where(active:true) }

  def present
    presenter = self.slice(:id, :name, :price, :service_stars, :active)
    presenter[:departure_city] = self.departure_city.present
    presenter[:destination_city] = self.destination_city.present
    presenter
  end
end
