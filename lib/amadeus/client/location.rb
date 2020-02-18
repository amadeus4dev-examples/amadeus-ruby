# frozen_string_literal: true

module Amadeus
  # A list of location types, as used in searching for locations
  module Location
    # Airport
    AIRPORT = 'AIRPORT'
    # City
    CITY = 'CITY'
    # Any
    ANY = [AIRPORT, CITY].join(',')
  end
end
