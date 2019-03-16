class BusTravel < ApplicationRecord
  belongs_to :search
  enum service_stars: { premium: 1, cama: 2, semicama: 3, pullman: 4 }

  attribute :service_stars, :integer, default: 0
end
