# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      # A namespaced client for the
      # +/v2/reference-data/urls+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.reference_data.urls
      #
      class Urls < Amadeus::Client::Decorator
        # The namespace for the CheckinLinks APIs:
        #
        # @return [Amadeus::Namespaces::ReferenceData::Urls::CheckinLinks]
        # @example
        #   amadeus.reference_data.urls.checkin_links
        #
        def checkin_links
          Amadeus::Namespaces::ReferenceData::Urls::CheckinLinks.new(client)
        end
      end
    end
  end
end
