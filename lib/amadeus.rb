require 'amadeus/version'
require 'amadeus/exceptions'
require 'amadeus/location'
require 'amadeus/response'
require 'amadeus/client/decorator'
require 'amadeus/client'

require 'amadeus/client/travel'
require 'amadeus/client/shopping'
require 'amadeus/client/reference_data'
require 'amadeus/client/reference_data/urls'
require 'amadeus/client/reference_data/urls/checkin_links'
require 'amadeus/client/reference_data/locations'
require 'amadeus/client/reference_data/locations/airports'
require 'amadeus/client/shopping/flight_destinations'
require 'amadeus/client/shopping/flight_offers'
require 'amadeus/client/shopping/flight_dates'
require 'amadeus/client/shopping/hotel_offers'
require 'amadeus/client/shopping/hotels'
require 'amadeus/client/shopping/hotels/offers'
require 'amadeus/client/shopping/hotels/hotel_offers'
require 'amadeus/client/travel/analytics'
require 'amadeus/client/travel/analytics/fare_searches'
require 'amadeus/client/travel/analytics/air_traffics'

# The namespace for the files used to make API
# calls to the Amadeus travel APIs
module Amadeus; end
