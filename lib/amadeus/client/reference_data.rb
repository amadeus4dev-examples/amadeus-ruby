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
    class ReferenceData < Amadeus::Client::Base
      # The namespace for the checkin links APIs:
      #
      #   amadeus.reference_data.urls.checkin_links
      #
      def urls
        Amadeus::Client::ReferenceData::Urls.new(client)
      end

      # The namespace for the location APIs:
      #
      #   amadeus.reference_data.locations
      #   amadeus.reference_data.locations.airports
      #
      def locations
        Amadeus::Client::ReferenceData::Locations.new(client)
      end
    end
  end
end
