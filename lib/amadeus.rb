# frozen_string_literal: true

require 'amadeus/version'
require 'amadeus/client/location'
require 'amadeus/client/direction'
require 'amadeus/client/response'
require 'amadeus/client/decorator'
require 'amadeus/client/access_token'
require 'amadeus/client/errors'
require 'amadeus/client'

require 'amadeus/namespaces/travel'
require 'amadeus/namespaces/shopping'
require 'amadeus/namespaces/reference_data'
require 'amadeus/namespaces/reference_data/airlines'
require 'amadeus/namespaces/reference_data/urls'
require 'amadeus/namespaces/reference_data/urls/checkin_links'
require 'amadeus/namespaces/reference_data/location'
require 'amadeus/namespaces/reference_data/locations'
require 'amadeus/namespaces/reference_data/locations/airports'
require 'amadeus/namespaces/shopping/flight_destinations'
require 'amadeus/namespaces/shopping/flight_offers'
require 'amadeus/namespaces/shopping/flight_offers/prediction'
require 'amadeus/namespaces/shopping/flight_dates'
require 'amadeus/namespaces/shopping/hotel_offers'
require 'amadeus/namespaces/shopping/hotel_offer'
require 'amadeus/namespaces/shopping/hotel_offers_by_hotel'
require 'amadeus/namespaces/travel/analytics'
require 'amadeus/namespaces/travel/analytics/air_traffic'
require 'amadeus/namespaces/travel/analytics/air_traffic/traveled'
require 'amadeus/namespaces/travel/analytics/air_traffic/booked'
require 'amadeus/namespaces/travel/analytics/air_traffic/searched'
require 'amadeus/namespaces/travel/analytics/air_traffic/searched_by_destination'
require 'amadeus/namespaces/travel/analytics/air_traffic/busiest_period'

# The namespace for the files used to make API
# calls to the Amadeus travel APIs
module Amadeus; end
