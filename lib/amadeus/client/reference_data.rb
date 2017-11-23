module Amadeus
  class Client
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
      # @return [Amadeus::Client::ReferenceData::Urls]
      # @example
      #   amadeus.reference_data.urls.checkin_links
      #
      def urls
        Amadeus::Client::ReferenceData::Urls.new(client)
      end

      # The namespace for the Locations APIs:
      #
      # @return [Amadeus::Client::ReferenceData::Locations]
      # @example
      #   amadeus.reference_data.locations
      #   amadeus.reference_data.locations.airports
      #
      def locations
        Amadeus::Client::ReferenceData::Locations.new(client)
      end
    end
  end
end
