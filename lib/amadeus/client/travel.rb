module Amadeus
  class Client
    # A namespaced client for the
    # +/v1/travel+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.travel
    #
    class Travel < Amadeus::Client::Base
    end
  end
end
