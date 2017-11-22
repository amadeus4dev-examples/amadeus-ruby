module Amadeus
  class Client
    # The root namespaces for this client
    module Namespaces
      # The namespace for the checkin links and locations APIs:
      #
      #   amadeus.reference_data.urls.checkin_links
      #   amadeus.reference_data.locations
      #
      def reference_data
        Amadeus::Client::ReferenceData.new(self)
      end

      # The namespace for the shopping APIs:
      #
      #   amadeus.shopping.flight_destinations
      #   amadeus.shopping.flight_offers
      #   amadeus.shopping.flight_dates
      #   amadeus.shopping.hotel_offers
      #   amadeus.shopping.hotels
      #
      def shopping
        Amadeus::Client::Shopping.new(self)
      end

      # The namespace for the travel analytics APIs:
      #
      #   amadeus.travel.analytics.air_traffics
      #   amadeus.travel.analytics.fare_searches
      #
      def travel
        Amadeus::Client::Travel.new(self)
      end
    end
  end
end
