module Amadeus
  class Client
    class Travel
      class Analytics
        # A namespaced client for the
        # +/v1/travel/analytics/air_traffics+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.travel.analytics.fair_searches
        #
        class FareSearches < Amadeus::Client::Base
        end
      end
    end
  end
end
