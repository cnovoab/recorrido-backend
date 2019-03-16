class Lookup < ApplicationRecord
  belongs_to :alert
  has_many :searches

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
end
