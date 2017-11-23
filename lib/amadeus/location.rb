module Amadeus
  # A list of location types, as used in searching for locations
  module Location
    # Airport
    AIRPORT = 'AIRPORT'.freeze
    # City
    CITY = 'CITY'.freeze
    # Any
    ANY = [AIRPORT, CITY].join(',')
  end
end
