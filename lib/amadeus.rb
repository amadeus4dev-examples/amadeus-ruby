# frozen_string_literal: true

require 'amadeus/version'
require 'amadeus/client/location'
require 'amadeus/client/response'
require 'amadeus/client/decorator'
require 'amadeus/client/access_token'
require 'amadeus/client/errors'
require 'amadeus/client'

require 'amadeus/namespaces/travel'
require 'amadeus/namespaces/shopping'
require 'amadeus/namespaces/reference_data'
require 'amadeus/namespaces/reference_data/urls'
require 'amadeus/namespaces/reference_data/urls/checkin_links'
require 'amadeus/namespaces/reference_data/location'
require 'amadeus/namespaces/reference_data/locations'
require 'amadeus/namespaces/reference_data/locations/airports'
require 'amadeus/namespaces/shopping/flight_destinations'
require 'amadeus/namespaces/shopping/flight_offers'
require 'amadeus/namespaces/shopping/flight_dates'
require 'amadeus/namespaces/shopping/hotel_offers'
require 'amadeus/namespaces/shopping/hotel'
require 'amadeus/namespaces/shopping/hotel/offer'
require 'amadeus/namespaces/shopping/hotel/hotel_offers'
require 'amadeus/namespaces/travel/analytics'
require 'amadeus/namespaces/travel/analytics/fare_searches'
require 'amadeus/namespaces/travel/analytics/air_traffic'

# The namespace for the files used to make API
# calls to the Amadeus travel APIs
module Amadeus; end
