module Amadeus
  class Client
    class Travel
      class Analytics
        # A namespaced client for the
        # +/v1/travel/analytics/fare-searches+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.travel.analytics.fare_searches
        #
        class FareSearches < Amadeus::Client::Decorator
        end
      end
    end
  end
end
