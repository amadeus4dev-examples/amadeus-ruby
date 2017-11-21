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
    end
  end
end
