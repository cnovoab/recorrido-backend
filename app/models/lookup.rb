class Lookup < ApplicationRecord
  belongs_to :alert
  has_many :searches
  has_many :bus_travels, through: :searches

  def search
    hydra = Typhoeus::Hydra.new

    date_range.each do |date|
      search = searches.new
      request = search.request(date)
      request.on_complete do |response|
        response = JSON.parse(response.body)
        search.resource_id = response["search_id"]
        search.save
      end
      hydra.queue(request)
    end

    hydra.run
  end

  def date_range
    Date.today..Date.today + 7.days
  end

  def finished?
    searches.all? { |s| s.ready? }
  end

  def better_price?
    min_price.present? && min_price <= alert.price
  end

  def tickets_below_price
    bus_travels.where('price <= ?', alert.price).order(:departure_date)
  end
end
