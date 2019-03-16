class BusTravel < ApplicationRecord
  belongs_to :search
  enum service_stars: %w(premium cama semicama pullman)

end
