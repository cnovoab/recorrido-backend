namespace :bus_travel do
  desc "Lookup for bus travels "
  task lookup: :environment do
    Alert.actives.each do |alert|
      lookup = alert.lookups.create
      lookup.search
      lookup.searches.each do |search|
        BusTravelSearchJob.set(wait: 3.seconds).perform_later(search.id)
      end
    end
  end

end
