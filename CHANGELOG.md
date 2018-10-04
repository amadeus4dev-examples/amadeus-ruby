# Changelog

## 1.0.0 - 2018-08-01

New version of the ruby gem to support our 3 new endpoints: 

* [Flight Most Booked Destinations](https://developers.amadeus.com/self-service/category/203/api-doc/27)

* [Flight Busiest Traveling Period](https://developers.amadeus.com/self-service/category/203/api-doc/28)

* [Airline Code Lookup](https://developers.amadeus.com/self-service/category/203/api-doc/26)


## 1.0.0 - 2018-04-19

The first stable version of the Amadeus for Developers ruby SDK

## 1.0.0.beta7 - 2018-04-19

Fix the Flight Most Traveled Destinations endpoint (air_traffic/traveled)

## 1.0.0.beta6 - 2018-04-05

Adds easier to read error messages

## 1.0.0.beta5 - 2018-03-28

Add support for Amadeus's specific `Accept` request header.

## 1.0.0.beta4 - 2018-03-28

Update singular endpoints to use singular names.

For example:

```sh
GET /v1/shopping/hotels/SMPARCOL/hotel-offers
```

becomes

```rb
amadeus.shopping.hotel('SMPARCOL').hotel_offers.get
```

## 1.0.0.beta3 - 2018-03-24

* Updates gemspec to specify a minimum Ruby version

## 1.0.0.beta2 - 2018-03-23

* Updated documentation for RubyInfo.org

## 1.0.0.beta1 - 2018-03-23

* First Beta release with support for all the initial API endpoints

## 0.1.0 - 2017-07-07

* Initial release
* Just a placeholder for the `amadeus` gem name
