class City < ApplicationRecord
  validates :name, presence: true
  validates :url_name, presence: true

  def self.fetch
    response = Typhoeus.get('https://www.recorrido.cl/api/v2/es/cities.json?country=chile')
    if response.success?
      cities = JSON.parse(response.response_body)
      return cities['cities']
    end
    []
  end

  def present
    self.slice(:id, :name, :country_id, :latitude, :longitude)
  end
end
