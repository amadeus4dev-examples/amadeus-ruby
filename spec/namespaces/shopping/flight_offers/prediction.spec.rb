# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Shopping::FlightOffers::Prediction do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Shopping::FlightOffers::Prediction.new(@client)
  end

  describe '.post' do
    it 'should call client.post with the right body' do
      body = 
      '{
          "data": [
              {
                  "type": "flight-offer",
                  "id": "1550657908557--1279609842",
                  "offerItems": [
                      {
                          "services": [
                              {
                                  "segments": [
                                      {
                                          "flightSegment": {
                                              "departure": {
                                                  "iataCode": "MAD",
                                                  "terminal": "4",
                                                  "at": "2019-08-02T11:25:00+02:00"
                                              },
                                              "arrival": {
                                                  "iataCode": "XCR",
                                                  "at": "2019-08-02T13:35:00+02:00"
                                              },
                                              "carrierCode": "IB",
                                              "number": "8540",
                                              "aircraft": {
                                                  "code": "CRK"
                                              },
                                              "operating": {
                                                  "carrierCode": "YW",
                                                  "number": "8540"
                                              },
                                              "duration": "0DT2H10M"
                                          },
                                          "pricingDetailPerAdult": {
                                              "travelClass": "ECONOMY",
                                              "fareClass": "A",
                                              "availability": 4,
                                              "fareBasis": "ADNNU0B4"
                                          }
                                      }
                                  ]
                              }
                          ],
                          "price": {
                              "total": "35.44",
                              "totalTaxes": "19.44"
                          },
                          "pricePerAdult": {
                              "total": "35.44",
                              "totalTaxes": "19.44"
                          }
                      }
                  ]
              }
          ],
          "dictionaries": {
              "carriers": {
                  "IB": "IBERIA",
                  "YW": "AIR NOSTRUM"
              },
              "currencies": {
                  "EUR": "EURO"
              },
              "aircraft": {
                  "CRK": "CANADAIR REGIONAL JET 1000"
              },
              "locations": {
                  "MAD": {
                      "subType": "AIRPORT",
                      "detailedName": "ADOLFO SUAREZ BARAJAS"
                  },
                  "XCR": {
                      "subType": "AIRPORT",
                      "detailedName": "CHALONS VATRY"
                  }
              }
          },
          "meta": {
              "links": {
                  "self": "https://api.amadeus.com/v1/shopping/flight-offers?origin=MAD&destination=PAR&departureDate=2019-08-02&adults=1&nonStop=false&max=1"
              },
              "currency": "EUR",
              "defaults": {
                  "nonStop": false,
                  "adults": 1
              }
          }
        }'

      expect(@client).to receive(:post).with(
        '/v1/shopping/flight-offers/prediction', body
      )

      @api.post(body)
    end

    it 'should default to an empty hash' do
      expect(@client).to receive(:post).with(
        '/v1/shopping/flight-offers/prediction', {}
      )

      @api.post
    end
  end
end
