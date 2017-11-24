# Amadeus Ruby SDK

[![Gem Version](https://badge.fury.io/rb/amadeus.svg)](https://badge.fury.io/rb/amadeus)
[![Build Status](http://img.shields.io/travis/twilio/twilio-ruby.svg)][travis]
[![Contact Support](https://img.shields.io/badge/contact-support-blue.svg)][support]

Amadeus provides a set of APIs for the travel industry. Flights, Hotels, Locations and more.

For more details see the [Ruby documentation](https://developer.amadeus.com/docs/ruby) on [Amadeus.com](https://developer.amadeus.com).

## Installation

This gem requires Ruby 2.2+. You can install install it directly or via bundler.

    source 'https://gLLtXNBEsQWTe4u5Un2w@gem.fury.io/workbetta/' do
      gem 'amadeus', '~> 0.1.0'
    end


__Next__: [Get Started with the Ruby SDK.](https://developer.amadeus.com/docs/ruby/get_started/initialize)

## Getting Started

To send make your first API call you will need to [register for an Amadeus Developer Account](https://developer.amadeus.com/register) and [set up your first application](https://dashboard.developer.amadeus.com/applications).

    require 'amadeus'

    amadeus = Amadeus::Client.new({
      client_id: '[YOUR_CLIENT_ID]',
      client_secret: '[YOUR_CLIENT_SECRET]'
    })

    amadeus.reference_data.urls.checkin_links.get({ airport: '1X' })
    # => {"meta"=>{"count"=>2, "links"=>{"self"=>"https://test.api.amadeus.com...

__Next__: [Learn more about Locations](https://developer.amadeus.com/docs/ruby/get_started/locations) with our Ruby SDK.

## Initialization

The client can be initialized directly.

    # Initialize using parameters
    amadeus = Amadeus::Client.new(client_id: '...', client_secret: '...')

Alternatively it can be initialized without any paramters if the environment variables `AMADEUS_CLIENT_ID` and `AMADEUS_CLIENT_SECRET` are present.

    amadeus = Amadeus::Client.new

Your credentials can be found on the [Amadeus dashboard](https://dashboard.developer.amadeus.com/client_ids). [Sign up](https://developer.amadeus.com/register) for an account today.

__Next__: [Learn more about our initializing the Ruby SDK](https://developer.amadeus.com/docs/ruby/get_started_initialize) in our documentation.

## Documentation

Amadeus has a large set of APIs, and our documentation is here to get you started today.

* [Get Started](https://developer.amadeus.com/docs/ruby/get_started) documentation
  * [Initialize the SDK](https://developer.amadeus.com/docs/ruby/get_started/initialize)
  * [Find an Airport](https://developer.amadeus.com/docs/ruby/get_started/find_an_airport)
  * [Book a Flight](https://developer.amadeus.com/docs/ruby/get_started/book_a_flight)
  * [Get Flight Inspiration](https://developer.amadeus.com/docs/ruby/get_started/get_flight_inspiration)

Alternatively, head over to our [Reference](https://developer.amadeus.com/docs/ruby/reference) documentation for in-depth information about every SDK method, it's arguments and return types.

Additionally, this SDK has extensive documentation of itself available on [RubyDoc.info](https://workbetta.github.io/amadeus-ruby/).

## Making API calls

This library conveniently maps every API path to a similar path.

For example, `GET /v2/reference-data/urls/checkin-links?airline=1X` would be:

    amadeus.reference_data.urls.checkin_links.get(airline: '1X')

Similarly, to select a resource by ID, you can pass in the ID to the path.

For example,  `GET /v1/shopping/hotel/123hotel-offers` would be:

    amadeus.hotels(123).hotel_offers.get(...)

You can make any arbitrary API call as well directly with the `.get` method:

    amadeus.get('/v2/reference-data/urls/checkin-links', airline: '1X')

## Response & Pagination

Every API call returns a `Amadeus::Response` object. If the API call contained
a JSON response it will parse the JSON into the `.json` attribute. If this data
also contains a `data` key, it will make that available as the `.data`
attribute.

    response = amadeus.reference_data.locations.get(
      keyword: 'LON',
      subType: Amadeus::Location::ANY
    )

    p reponse.json #=> The complete JSON response
    p response.data #=> The list of locations

If an API endpoint supports pagination, the other pages are available under the
`.next`, `.previous`, `.last` and `.first` methods.

    response = amadeus.reference_data.locations.get(
      keyword: 'LON',
      subType: Amadeus::Location::ANY
    )

    response.next #=> returns a new response for the next page

If a page is not available, the method will return `nil`.

## Logging & Debugging

The SDK makes it easy to add your own logger.

    require 'logger'

    amadeus = Amadeus::Client.new(
      client_id: '...',
      client_secret: '...',
      logger: Logger.new(STDOUT)
    )

Additionally, to enable more verbose logging, you can set the appropriate level either via a parameter on initialization, or using the `AMADEUS_LOG_LEVEL` environment variable.

    require 'logger'

    amadeus = Amadeus::Client.new(
      client_id: '...',
      client_secret: '...',
      log_level: Logger::DEBUG # defaults to Logger::WARN, aka "2"
    )

## License

This library is released under the [MIT License](LICENSE).

## Help

Our [developer support team](https://developer.amadeus.com/developers) is here to help you. You can find us on [Twitter](#), [StackOverflow](#), and [email](#).

[gem]: https://rubygems.org/gems/twilio-ruby
[travis]: http://travis-ci.org/twilio/twilio-ruby
[support]: http://developer.amadeus.com/support
