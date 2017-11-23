module Amadeus
  class Client
    class Travel
      class Analytics
        # A namespaced client for the
        # +/v1/travel/analytics/air-traffics+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.travel.analytics.air_traffics
        #
        class AirTraffics < Amadeus::Client::Decorator
        end
      end
    end
  end
end
