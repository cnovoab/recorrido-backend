
class Search < ApplicationRecord
  API_URL = 'https://www.recorrido.cl/api/v2/es'.freeze

  attribute :search_date, :datetime, default: Time.now.utc
  attribute :status, :string, default: :pending
  attr_writer :search_date
  belongs_to :lookup
  has_many :bus_travels

  scope :pending, -> { where('status != ?', 'complete') }

  def request(date = Date.today)
    Typhoeus::Request.new("#{API_URL}/bus_travels.json", {
      method: 'post',
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      },
      body: JSON.dump(
        bus_travel: {
          departure_city_id: lookup.alert.departure_city_id,
          destination_city_id: lookup.alert.destination_city_id,
          departure_date: date.strftime('%d-%m-%Y')
        }
      )
    })
  end

  def status
    Typhoeus.get("#{API_URL}/search_progresses/#{resource_id}.json")
  end

  def ready?
    return true if self.status == 'complete'
    response = JSON.parse(status.response_body)
    return false unless response["progress_status"] == 'complete'
    self.update(status: 'complete')
    true
  end

  def fetch_results
    url = "#{API_URL}/bus_travels/#{resource_id}/search_results.json"
    Typhoeus.get(url, headers: { Accept: 'application/json' })
  end
end
