namespace :bus_travel do
  desc "Lookup for bus travels "
  task lookup: :environment do
    Alert.actives.each do |alert|
      lookup = alert.lookups.create
      lookup.search
      lookup.searches.each do |search|
        BusTravelSearchJob.set(wait: 3.seconds).perform_later(search.id)
      end

      sleep(5)

      if lookup.finished? && !lookup.better_price?
        params = { user: alert.user, tickets: lookup.tickets_below_price, alert: alert }
        UserMailer.with(params).alert_email.deliver_now
      end
    end
  end

end
