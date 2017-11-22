module Amadeus
  class Client
    class Travel
      # A namespaced client for the
      # +/v1/travel/analytics+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.travel.analytics
      #
      class Analytics < Amadeus::Client::Base
        # The namespace for the air traffics API:
        #
        #   amadeus.travel.analytics.air_traffics
        #
        def air_traffics
          Amadeus::Client::Travel::Analytics::AirTraffics.new(client)
        end

        # The namespace for the fare searches API:
        #
        #   amadeus.travel.analytics.fare_searches
        #
        def fare_searches
          Amadeus::Client::Travel::Analytics::FareSearches.new(client)
        end
      end
    end
  end
end
