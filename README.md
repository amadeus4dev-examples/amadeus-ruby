# Amadeus Ruby SDK

[![Gem Version](https://badge.fury.io/rb/amadeus.svg)][gem]
[![Build Status](https://travis-ci.org/amadeus4dev/amadeus-ruby.svg?branch=master)][travis]
[![Maintainability](https://api.codeclimate.com/v1/badges/d2e15221a502a7d71144/maintainability)](https://codeclimate.com/github/amadeus4dev/amadeus-ruby/maintainability)
[![Dependencies](https://github.com/amadeus4dev/amadeus-ruby/raw/master/.github/images/dependencies.svg?sanitize=true)](gem)
[![Contact Support](https://github.com/amadeus4dev/amadeus-ruby/raw/master/.github/images/support.svg?sanitize=true)][support]

Amadeus provides a set of APIs for the travel industry. Flights, Hotels, Locations and more.

For more details see the [Ruby
documentation](https://amadeus4dev.github.io/amadeus-ruby/) on
[Amadeus.com](https://developers.amadeus.com).

## Installation

This gem requires Ruby 2.3+. You can install install it directly or via bundler.
#### Command line
```bash
gem install amadeus
```
#### Bundler
```rb
gem 'amadeus'
```

## Getting Started

To make your first API call you will need to [register for an Amadeus
Developer Account](https://developers.amadeus.com/create-account) and set up
your first application.

```rb
require 'amadeus'

amadeus = Amadeus::Client.new({
  client_id: 'REPLACE_BY_YOUR_API_KEY',
  client_secret: 'REPLACE_BY_YOUR_API_SECRET'
})

begin
  puts amadeus.reference_data.urls.checkin_links.get({ airlineCode: 'BA' })
rescue Amadeus::ResponseError => error
  puts error
end
```

## Initialization

The client can be initialized directly.

```rb
# Initialize using parameters
amadeus = Amadeus::Client.new(client_id: 'REPLACE_BY_YOUR_API_KEY', client_secret: 'REPLACE_BY_YOUR_API_SECRET')
```

Alternatively it can be initialized without any parameters if the environment
variables `AMADEUS_CLIENT_ID` and `AMADEUS_CLIENT_SECRET` are present.

```rb
amadeus = Amadeus::Client.new
```

Your credentials can be found on the [Amadeus
dashboard](https://developers.amadeus.com/my-apps). [Sign
up](https://developers.amadeus.com/create-account) for an account today.

By default the environment for the SDK is the `:test` environment. To switch to
a production (paid-for) environment please switch the hostname as follows:

```rb
amadeus = Amadeus::Client.new(hostname: :production)
```

## Documentation

Amadeus has a large set of APIs, and our documentation is here to get you
started today. Head over to our
[Reference](https://amadeus4dev.github.io/amadeus-ruby/) documentation for
in-depth information about every SDK method, its arguments and return types.


* [Get Started](https://amadeus4dev.github.io/amadeus-ruby/) documentation
  * [Initialize the SDK](https://amadeus4dev.github.io/amadeus-ruby/)
  * [Find an Airport](https://amadeus4dev.github.io/amadeus-ruby/Amadeus/Namespaces/ReferenceData/Locations/Airports.html)
  * [Find a Flight](https://amadeus4dev.github.io/amadeus-ruby/Amadeus/Namespaces/Shopping/FlightOffers.html)
  * [Get Flight Inspiration](https://amadeus4dev.github.io/amadeus-ruby/Amadeus/Namespaces/Shopping/FlightDestinations.html)

## Making API calls

This library conveniently maps every API path to a similar path.

For example, `GET /v2/reference-data/urls/checkin-links?airlineCode=BA` would be:

```rb
amadeus.reference_data.urls.checkin_links.get(airlineCode: 'BA')
```

Similarly, to select a resource by ID, you can pass in the ID to the **singular** path.

For example,  `GET /v2/shopping/hotel-offers/XZY` would be:

```rb
amadeus.shopping.hotel_offer('D5BEE9D0D08B6678C2F5FAD910DC110BCDA187D21D4FCE68ED423426D0A246BB').get
```

You can make any arbitrary API call as well directly with the `.get` method:

```rb
amadeus.get('/v2/reference-data/urls/checkin-links', airlineCode: 'BA')
```

## Response

Every API call returns a `Amadeus::Response` object. If the API call contained
a JSON response it will parse the JSON into the `.result` attribute. If this data
also contains a `data` key, it will make that available as the `.data`
attribute. The raw body of the response is always avaulable as the `.body` attribute.

```rb
response = amadeus.reference_data.locations.get(
  keyword: 'LON',
  subType: Amadeus::Location::ANY
)

p response.body #=> The raw response, as a string
p response.result #=> The body parsed as JSON, if the result was parsable
p response.data #=> The list of locations, extracted from the JSON
```

## Pagination

If an API endpoint supports pagination, the other pages are available under the
`.next`, `.previous`, `.last` and `.first` methods.

```rb
response = amadeus.reference_data.locations.get(
  keyword: 'LON',
  subType: Amadeus::Location::ANY
)

amadeus.next(response) #=> returns a new response for the next page
```

If a page is not available, the method will return `nil`.

## Logging & Debugging

The SDK makes it easy to add your own logger.

```rb
require 'logger'

amadeus = Amadeus::Client.new(
  client_id: 'REPLACE_BY_YOUR_API_KEY',
  client_secret: 'REPLACE_BY_YOUR_API_SECRET',
  logger: Logger.new(STDOUT)
)
```

Additionally, to enable more verbose logging, you can set the appropriate level
on your own logger, though the easiest way would be to enable debugging via a
parameter on initialization, or using the `AMADEUS_LOG_LEVEL` environment
variable.

```rb
require 'logger'

amadeus = Amadeus::Client.new(
  client_id: 'REPLACE_BY_YOUR_API_KEY',
  client_secret: 'REPLACE_BY_YOUR_API_SECRET',
  log_level: 'debug' # or "warn" or "silent", defaults to "silent"
)
```
## List of supported endpoints
```rb
# Flight Inspiration Search
amadeus.shopping.flight_destinations.get(origin: 'MAD')

# Flight Cheapest Date Search
amadeus.shopping.flight_dates.get(origin: 'MAD', destination: 'MUC')

# Flight Low-fare Search
amadeus.shopping.flight_offers.get(origin: 'NYC', destination: 'MAD', departureDate: '2019-08-01')

# Flight Low-fare Search
amadeus.shopping.flight_offers.get(origin: 'NYC', destination: 'MAD', departureDate: '2019-08-01')

# Flight Choice Prediction / Be careful, this example combines 2 API calls: 1. Flight Low-fare Search then Flight Choice Prediction
amadeus.shopping.flight_offers.prediction.post(amadeus.shopping.flight_offers.get(origin: 'NYC', destination: 'MAD', departureDate: '2020-01-01').body)

# Flight Check-in Links
amadeus.reference_data.urls.checkin_links.get(airlineCode: 'BA')

# Airline Code Lookup
amadeus.reference_data.airlines.get(airlineCodes: 'U2')

# Airport & City Search (autocomplete)
# Find all the cities and airports starting by the keyword 'LON'
amadeus.reference_data.locations.get(
  keyword: 'LON',
  subType: Amadeus::Location::ANY
)
# Get a specific city or airport based on its id
amadeus.reference_data.location('ALHR').get

# Airport Nearest Relevant (for London)
amadeus.reference_data.locations.airports.get(longitude: 0.1278, latitude: 51.5074)

# Flight Most Searched Destinations
# Get the most searched destinations from an origin
amadeus.travel.analytics.air_traffic.searched.get(originCityCode: 'MAD', searchPeriod: '2017-08', marketCountryCode: 'ES')
# How many people in Spain searched for a trip from Madrid to New-York in August 2017?
amadeus.travel.analytics.air_traffic.searched_by_destination.get(originCityCode: 'MAD', destinationCityCode: 'NYC', searchPeriod: '2017-08', marketCountryCode: 'ES')

# Flight Most Booked Destinations
amadeus.travel.analytics.air_traffic.booked.get(originCityCode: 'MAD', period: '2017-08')

# Flight Most Traveled Destinations
amadeus.travel.analytics.air_traffic.traveled.get(originCityCode: 'MAD', period: '2017-01')

# Flight Busiest Period
amadeus.travel.analytics.air_traffic.busiest_period.get(
  cityCode: 'MAD',
  period: '2017',
  direction: Amadeus::Direction::ARRIVING
)

# Hotel Search API
# Get list of hotels by cityCode
amadeus.shopping.hotel_offers.get(cityCode: 'MAD')
# Get list of offers for a specific hotel
amadeus.shopping.hotel_offers_by_hotel.get(hotelId: 'IALONCHO')
# Confirm the availability of a specific offer
amadeus.shopping.hotel_offer('D5BEE9D0D08B6678C2F5FAD910DC110BCDA187D21D4FCE68ED423426D0A246BB').get

# Point of Interest
# What are the popular places in Barcelona (based a geo location and a radius)
amadeus.reference_data.locations.points_of_interest.get(latitude: 41.397158, longitude: 2.160873)
# What are the popular places in Barcelona? (based on a square)
amadeus.reference_data.locations.points_of_interest.by_square.get(north: 41.397158, west: 2.160873, south: 41.394582, east: 2.177181)
```
## Development & Contributing

Want to contribute? Read our [Contributors Guide](.github/CONTRIBUTING.md) for
guidance on installing and running this code in a development environment.


## License

This library is released under the [MIT License](LICENSE).

## Help

Our [developer support team](https://developers.amadeus.com/support) is here
to help you. You can find us on
[StackOverflow](https://stackoverflow.com/questions/tagged/amadeus) and
[email](mailto:developers@amadeus.com).

[gem]: https://rubygems.org/gems/amadeus
[travis]: http://travis-ci.org/amadeus4dev/amadeus-ruby
[support]: http://developers.amadeus.com/support
[codeclimate]: https://codeclimate.com/github/amadeus4dev/amadeus-ruby
