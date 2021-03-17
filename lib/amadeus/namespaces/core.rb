# frozen_string_literal: true

module Amadeus
  # The namespaces that allow this API to map the paths
  # of the API to similar calls on the SDK
  #
  # Access via the +Amadeus::Client+ object
  #
  #   amadeus = Amadeus::Client.new
  #   amadeus.reference_data
  #   amadeus.shopping
  #   amadeus.travel
  #
  module Namespaces
    # The namespace for the checkin links and locations APIs:
    #
    # @return [Amadeus::Namespaces::ReferenceData]
    # @example Some of the further namespaces available
    #   amadeus.reference_data.urls.checkin_links
    #   amadeus.reference_data.locations
    #
    def reference_data
      ReferenceData.new(self)
    end

    # The namespace for the shopping APIs:
    #
    # @return [Amadeus::Namespaces::Shopping]
    # @example Some of the further namespaces available
    #   amadeus.shopping.flight_destinations
    #   amadeus.shopping.flight_offers
    #   amadeus.shopping.flight_dates
    #   amadeus.shopping.hotel_offers
    #   amadeus.shopping.hotels
    #
    def shopping
      Shopping.new(self)
    end

    # The namespace for the booking APIs:
    #
    # @return [Amadeus::Namespaces::Booking]
    # @example Some of the further namespaces available
    #   amadeus.booking.hotel_bookings
    #
    def booking
      Booking.new(self)
    end

    # The namespace for the travel analytics APIs:
    #
    # @return [Amadeus::Namespaces::Travel]
    # @example Some of the further namespaces available
    #   amadeus.travel.analytics.air_traffic
    #   amadeus.travel.analytics.fare_searches
    #
    def travel
      Travel.new(self)
    end

    # The namespace for the E Reputation  APIs:
    #
    # @return [Amadeus::Namespaces::EReputation]
    # @example Some of the further namespaces available
    #   amadeus.e_reputation.hotel_sentiments
    #
    def e_reputation
      EReputation.new(self)
    end

    # The namespace for the Airport  APIs:
    #
    # @return [Amadeus::Namespaces::Airport]
    # @example Some of the further namespaces available
    #   amadeus.airport.predictions
    #
    def airport
      Airport.new(self)
    end

    # The namespace for the Safety related APIs:
    #
    # @return [Amadeus::Namespaces::Safety]
    # @example Some of the further namespaces available
    #   amadeus.safety.safety_rated_locations
    #
    def safety
      Safety.new(self)
    end

    # The namespace for the Analytics related APIs:
    #
    # @return [Amadeus::Namespaces::Analytics]
    # @example Some of the further namespaces available
    #   amadeus.analytics.itinerary_price_metrics
    #
    def analytics
      Analytics.new(self)
    end
  end
end
