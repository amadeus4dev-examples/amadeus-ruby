module Amadeus
  class Client
    class ReferenceData
      # A namespaced client for the
      # +/v2/reference_data/urls+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.reference_data.urls
      #
      class Urls < Amadeus::Client::Base
        # The namespace for the CheckinLinks APIs:
        #
        #   amadeus.reference_data.urls.checkin_links
        #
        def checkin_links
          Amadeus::Client::ReferenceData::Urls::CheckinLinks.new(client)
        end
      end
    end
  end
end
