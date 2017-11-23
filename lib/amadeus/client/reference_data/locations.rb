module Amadeus
  class Client
    class ReferenceData
      # A namespaced client for the
      # +/v2/reference-data/locations+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.reference_data.locations
      #
      class Locations < Amadeus::Client::Decorator
        # The namespace for the Airports API:
        #
        # @return [Amadeus::Client::ReferenceData::Locations::Airports]
        # @example
        #   amadeus.reference_data.locations.airports
        #
        def airports
          Amadeus::Client::ReferenceData::Locations::Airports.new(client)
        end
      end
    end
  end
end
