# Amadeus Ruby SDK

[![Gem Version](https://badge.fury.io/rb/amadeus.svg)][gem]
[![Build Status](https://travis-ci.org/amadeus4dev/amadeus-ruby.svg?branch=master)][travis]
[![Maintainability](https://api.codeclimate.com/v1/badges/d2e15221a502a7d71144/maintainability)](https://codeclimate.com/github/amadeus4dev/amadeus-ruby/maintainability)
[![Dependencies](.github/images/dependencies.svg)](gem)
[![Contact Support](.github/images/support.svg)][support]

Amadeus provides a set of APIs for the travel industry. Flights, Hotels, Locations and more.

For more details see the [Ruby documentation](https://developer.amadeus.com/docs/ruby) on [Amadeus.com](https://developer.amadeus.com) and the [class reference](https://amadeus4dev.github.io/amadeus-ruby) here on GitHub.

## Installation

This gem requires Ruby 2.2+. You can install install it directly or via bundler.

```rb
gem 'amadeus', '~> 1.0.0.beta5'
```

__Next__: [Get Started with the Ruby SDK.](https://developer.amadeus.com/docs/ruby/get_started/initialize)

## Getting Started

To send make your first API call you will need to [register for an Amadeus Developer Account](https://developer.amadeus.com/register) and [set up your first application](https://dashboard.developer.amadeus.com/applications).

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

__Next__: [Learn more about checkin links](https://developer.amadeus.com/docs/ruby/get_started/checkin_links) with our Ruby SDK.

## Initialization

The client can be initialized directly.

```rb
# Initialize using parameters
amadeus = Amadeus::Client.new(client_id: '...', client_secret: '...')
```

Alternatively it can be initialized without any paramters if the environment variables `AMADEUS_CLIENT_ID` and `AMADEUS_CLIENT_SECRET` are present.

```rb
amadeus = Amadeus::Client.new
```

Your credentials can be found on the [Amadeus dashboard](https://dashboard.developer.amadeus.com/client_ids). [Sign up](https://developer.amadeus.com/register) for an account today.

By default the environment for the SDK is the `:test` environment. To switch to a production (paid-for) environment please switch the hostname as follows:

```rb
amadeus = Amadeus::Client.new(hostname: :production)
```

__Next__: [Learn more about our initializing the Ruby SDK](https://developer.amadeus.com/docs/ruby/get_started_initialize) in our documentation.

## Documentation

Amadeus has a large set of APIs, and our documentation is here to get you started today.

* [Get Started](https://developer.amadeus.com/docs/ruby/get_started) documentation
  * [Initialize the SDK](https://developer.amadeus.com/docs/ruby/get_started/initialize)
  * [Find an Airport](https://developer.amadeus.com/docs/ruby/get_started/find_an_airport)
  * [Book a Flight](https://developer.amadeus.com/docs/ruby/get_started/book_a_flight)
  * [Get Flight Inspiration](https://developer.amadeus.com/docs/ruby/get_started/get_flight_inspiration)

Alternatively, head over to our [Reference](https://developer.amadeus.com/docs/ruby/reference) documentation for in-depth information about every SDK method, it's arguments and return types.

Additionally, this SDK has extensive documentation of itself available on [RubyDoc.info](http://www.rubydoc.info/gems/amadeus/).

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

Additionally, to enable more verbose logging, you can set the appropriate level on your own logger, though the easiest way would be to enable debugging via a parameter on initialization, or using the `AMADEUS_LOG_LEVEL` environment variable.

```rb
require 'logger'

amadeus = Amadeus::Client.new(
  client_id: '...',
  client_secret: '...',
  log_level: 'debug'
)
```

## Development & Contributing

Want to contribute? Read our [Contributors Guide](.github/CONTRIBUTING.md) for guidance on installing and running this code in a development environment.


## License

This library is released under the [MIT License](LICENSE).

## Help

Our [developer support team](https://developer.amadeus.com/developers) is here to help you. You can find us on [Twitter](#), [StackOverflow](#), and [email](#).

[gem]: https://rubygems.org/gems/amadeus
[travis]: http://travis-ci.org/amadeus4dev/amadeus-ruby
[support]: http://developer.amadeus.com/support
[codeclimate]: https://codeclimate.com/github/amadeus4dev/amadeus-ruby
