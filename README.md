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

This gem requires Ruby 2.2+. You can install install it directly or via bundler.
#### Command line
```bash
gem install amadeus
```
#### Bundler
```rb
gem 'amadeus'
```

## Getting Started

To send make your first API call you will need to [register for an Amadeus
Developer Account](https://developers.amadeus.com/create-account) and set up
your first application.

```rb
require 'amadeus'

amadeus = Amadeus::Client.new({
  client_id: '[YOUR_CLIENT_ID]',
  client_secret: '[YOUR_CLIENT_SECRET]'
})

begin
  puts amadeus.reference_data.urls.checkin_links.get({ airline: '1X' })
  # => {"meta"=>{"count"=>2, "links"=>{"self"=>"https://test.api.amadeus.com...
rescue Amadeus::ResponseError => error
  puts error
end
```

## Initialization

The client can be initialized directly.

```rb
# Initialize using parameters
amadeus = Amadeus::Client.new(client_id: '...', client_secret: '...')
```

Alternatively it can be initialized without any paramters if the environment
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

For example, `GET /v2/reference-data/urls/checkin-links?airline=1X` would be:

```rb
amadeus.reference_data.urls.checkin_links.get(airline: '1X')
```

Similarly, to select a resource by ID, you can pass in the ID to the **singular** path.

For example,  `GET /v1/shopping/hotel/123/offers/234` would be:

```rb
amadeus.hotel(123).offer(234).get(...)
```

You can make any arbitrary API call as well directly with the `.get` method:

```rb
amadeus.get('/v2/reference-data/urls/checkin-links', airline: '1X')
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

p reponse.body #=> The raw response, as a string
p reponse.result #=> The body parsed as JSON, if the result was parsable
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
  client_id: '...',
  client_secret: '...',
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
  client_id: '...',
  client_secret: '...',
  log_level: 'debug' # or "warn" or "silent", defaults to "silent"
)
```
## List of supported endpoints:
```rb
# Flight Cheapest Date Search
amadeus.shopping.flight_dates.get(origin: 'NCE', destination: 'PAR', duration: 1)

# Flight Inspiration Search
amadeus.shopping.flight_destinations.get(origin: 'MAD')

# Flight Low-fare Search
amadeus.shopping.flight_offers.get(origin: 'MAD', destination: 'OPO', departureDate: '2018-07-08')

# Flight Check-in Links
amadeus.reference_data.urls.checkin_links.get({ airline: '1X' })

# Airport & City Search (autocomplete)
# Find all the cities and airports starting by the keyword 'Lon'
amadeus.reference_data.locations.get(
  keyword: 'Lon',
  subType: Amadeus::Location::ANY
)
# Get a specific city or airport based on its id
amadeus.reference_data.location('ALHR').get

# Airport Nearest Relevant 
amadeus.reference_data.locations.airports.get(longitude: 49.0000, latitude: 2.55)

# Flight Most Searched Destinations
amadeus.travel.analytics.fare_searches.get(origin: 'NCE', sourceCountry: 'FR', period: '2017-08')

# Flight Most Traveled Destinations
ramadeus.travel.analytics.air_traffic.traveled.get(origin: 'NCE', period: '2017-08')

# Hotel Search API
# Get list of hotels by cityCode
amadeus.shopping.hotel_offers.get(cityCode: 'PAR')
# Get list of offers for a specific hotel
amadeus.shopping.hotel('SMPARCOL').hotel_offers.get
# Confirm the availability of a specific offer for a specific hotel
amadeus.shopping.hotel('SMPARCOL').offer('4BA070CE929E135B3268A9F2D0C51E9D4A6CF318BA10485322FA2C7E78C7852E').get
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
