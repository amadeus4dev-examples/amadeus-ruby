# Changelog
## 5.2.1 - 2021-11-30
Migrate to Github actions

## 5.2.0 - 2021-03-20

Add support for Flight Price Analysis. Thanks [@developius](https://github.com/developius) for the contribution.
## 5.1.0 - 2020-11-26

Add support for Safe Place API.
Add support for retrieve by id for Points Of Interest API
## 5.0.0 - 2020-05-14
Release of the Flight Offers Search API.

Add support for the Flight Choice Prediction v2.

Decommission of the Flight Low-fare Search and Flight Choice Prediction v1.

## 4.0.0 - 2020-02-12
Release of the [Hotel Booking API](https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-booking)

> The Amadeus Hotel Booking API lets you complete bookings at over 150,000 hotels and accommodations around the world. To complete bookings, you must first use the Amadeus Hotel Search API to search for hotel deals, select the desired offer and confirm the final price and availability. You can then use the Hotel Booking API to complete the reservation by providing an offer id, guest information and payment information.

Decommissioning of the `Flight Most Searched Destination API`

## 3.3.0 - 2019-11-12
Release of the [Hotel Ratings](https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-ratings)

> The Hotel Ratings API uses a sentiment analysis algorithm to return an overall rating for a hotel as well as ratings for different criteria like location, comfort, service, staff, internet, food, facilities, pool or sleep quality. The ratings are on a scale of 0 to 100. The API is used to provide valuable content during the hotel search and shopping experience and permits hotel results to sorted by overall ratings or category ratings.

## 3.2.0 - 2019-05-08
Release of the [Flight Choice Prediction API](https://developers.amadeus.com/self-service/category/air/api-doc/flight-choice-prediction)

> The Flight Choice Prediction API allows developers to forecast traveler choices in the context of search & shopping. Exposing machine learning & AI services for travel, this API consumes the output of the Flight Low-fare Search API and returns augmented content with probabilities of choices for each flight offers.

## 3.1.0 - 2019-03-25
Release of the [Point of Interest API](https://developers.amadeus.com/self-service/category/210/api-doc/55)

> The Points Of Interest API, powered by AVUXI TopPlace, is a search API that returns a list of popular places for a particular location. The location can be defined as area bound by four coordinates or as a geographical coordinate with a radius. The popularity of a place or 'point of interest' is determined by AVUXI's proprietary algorithm that considers factors such as ratings, check-ins, category scores among other factors from a host of online media sources.

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
