module Amadeus
  class Client
    class ReferenceData
      class Urls
        # A namespaced client for the
        # +/v1/reference_data/urls/checkin_links+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.reference_data.urls.checkin_links
        #
        class CheckinLinks < Amadeus::Client::Base
        end
      end
    end
  end
end
