class SearchNotReadyException < StandardError; end

class BusTravelSearchJob < ApplicationJob
  retry_on SearchNotReadyException, wait: 5.seconds, attempts: 5
  queue_as :default

  def perform(search_id)
    search = Search.find(search_id)
    raise SearchNotReadyException unless search.ready?

    stars = search.lookup.alert.service_stars
    results = JSON.parse(search.fetch_results.response_body)
    results = results['outbound']['search_results']
    results = results.select { |res| stars.nil? || res['seat_klass_stars'] == stars }

    unless results.empty?
      results.sort_by! { |res| res['price'] }
      cheapest = results.first
      bus_travel = search.bus_travels.new
      bus_travel.departure_date = cheapest['departure_time']
      bus_travel.service_stars = cheapest['seat_klass_stars']
      bus_travel.price = cheapest['price']
      bus_travel.bus_operator_id = cheapest['bus_operator_id']
      bus_travel.bus_operator = cheapest['bus_operator_name']
      bus_travel.save

      # Update lookup min_price
      if search.lookup.min_price.nil? || search.lookup.min_price > cheapest['price']
        search.lookup.update(min_price: cheapest['price'])
      end
    end

    results
  end
end
