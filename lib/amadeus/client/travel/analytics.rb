module Amadeus
  class Client
    class Travel
      # A namespaced client for the
      # +/v1/travel/analytics+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.travel.analytics
      #
      class Analytics < Amadeus::Client::Base
      end
    end
  end
end
