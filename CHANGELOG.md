# Changelog
## 3.0.0 - 2019-01-22

## Hotel Search v2 has been deployed (Hotel Search v1 is now deprecated)

### General
* URLs for all three endpoints have been simplified for ease-of-use and consistency
### Find Hotels - 1st endpoint
* The parameter `hotels` has been renamed to `hotelIds`
### View Hotel Rooms - 2nd endpoint
* Update from `amadeus.shopping.hotel('IALONCHO').hotel_offers.get` to `amadeus.shopping.hotel_offers_by_hotel.get(hotelId: 'IALONCHO')`
* Now get all images in ‘View Hotels Rooms’ endpoint using the view parameter as               `FULL_ALL_IMAGES`
### View Room Details - 3rd endpoint
* Updated from `amadeus.shopping.hotel('IALONCHO').offer('XXX').get` to `amadeus.shopping.hotel_offer('XXX').get`
* Image category added under Media in the response
* Hotel distance added in the response
* Response now refers to the common HotelOffer object model

## 2.0.0 - 2018-10-12

[Flight Most Searched Destinations](https://developers.amadeus.com/self-service/category/203/api-doc/6): Redesign of the API - Split the previous endpoint in 2 endpoints:
* 1st endpoint to find the most searched destinations
* 2nd endpoint to have more data about a dedicated origin & destination

[Flight Most Booked Destinations](https://developers.amadeus.com/self-service/category/203/api-doc/27):
* Rename origin to originCityCode

[Flight Most Traveled Destinations](https://developers.amadeus.com/self-service/category/203/api-doc/7):
* Rename origin in originCityCode

[Flight Check-in Links](https://developers.amadeus.com/self-service/category/203/api-doc/8):
* Rename airline to airlineCode

[Airport & City Search](https://developers.amadeus.com/self-service/category/203/api-doc/10):
* Remove parameter onlyMajor

[Airport Nearest Relevant](https://developers.amadeus.com/self-service/category/203/api-doc/9):
* Add radius as parameter

[Airline Code Lookup](https://developers.amadeus.com/self-service/category/203/api-doc/26):
* Regroup parameters _IATACode_ and _ICAOCode_ under the same name _airlineCodes_

## 1.1.0 - 2018-08-01

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
