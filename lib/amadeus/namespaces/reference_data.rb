# frozen_string_literal: true

module Amadeus
  module Namespaces
    # A namespaced client for the
    # +/v2/reference_data+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.reference_data
    #
    class ReferenceData < Amadeus::Client::Decorator
      # The namespace for the Urls APIs.
      #
      # @return [Amadeus::Namespaces::ReferenceData::Urls]
      # @example
      #   amadeus.reference_data.urls.checkin_links
      #
      def urls
        Amadeus::Namespaces::ReferenceData::Urls.new(client)
      end

      # The namespace for the Locations APIs:
      #
      # @return [Amadeus::Namespaces::ReferenceData::Locations]
      # @example
      #   amadeus.reference_data.locations
      #   amadeus.reference_data.locations.airports
      #
      def locations
        Amadeus::Namespaces::ReferenceData::Locations.new(client)
      end

      # The namespace for the Location APIs - accessing a specific location
      #
      # @param [Number] location_id The ID for the location
      # @return [Amadeus::Namespaces::ReferenceData::Locations]
      # @example
      #   amadeus.reference_data.location('ALHR')
      #
      def location(location_id)
        Amadeus::Namespaces::ReferenceData::Location.new(client, location_id)
      end

      # The namespace for the Airline Code APIs - accessing a specific airline
      #
      # @return [Amadeus::Namespaces::ReferenceData::Airlines]
      # @example
      #   amadeus.reference_data.airlines('U2')
      #
      def airlines
        Amadeus::Namespaces::ReferenceData::Airlines.new(client)
      end
    end
  end
end
