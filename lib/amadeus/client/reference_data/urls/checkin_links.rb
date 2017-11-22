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
        class CheckinLinks < Amadeus::Client::Decorator
          # Returns the checkin links for an airline, for the
          # language of your choice
          #
          #   response = amadeus.reference_data.urls.checkin_links.get(
          #     airline: '1X',
          #     language: 'en-GB'
          #   )
          #
          #   p response.data
          #   # {"meta"=>{"count"=>2, "links"=>{"self"=>"https://test.api.ama...
          #
          def get(params = {})
            client.get('/v2/reference-data/urls/checkin-links', params)
          end
        end
      end
    end
  end
end
