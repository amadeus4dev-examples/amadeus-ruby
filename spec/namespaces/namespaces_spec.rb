# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces do
  describe 'Amadeus::Client' do
    before do
      @amadeus = Amadeus::Client.new(
        client_id: '123',
        client_secret: '234'
      )
    end

    describe '.reference_data' do
      it 'should return a ReferenceData object' do
        expect(@amadeus.reference_data).to(
          be_instance_of Amadeus::Namespaces::ReferenceData
        )
      end
    end

    describe '.reference_data.urls' do
      it 'should return a Url object' do
        expect(@amadeus.reference_data.urls).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Urls
        )
      end
    end

    describe '.reference_data.urls.checkin_links' do
      it 'should return a CheckinLinks object' do
        expect(@amadeus.reference_data.urls.checkin_links).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Urls::CheckinLinks
        )
      end
    end

    describe '.reference_data.urls.airlines' do
      it 'should return an Airline object' do
        expect(@amadeus.reference_data.airlines).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Airlines
        )
      end
    end

    describe '.reference_data.locations' do
      it 'should return a Locations object' do
        expect(@amadeus.reference_data.locations).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Locations
        )
      end

      it 'should return a Location object if an ID is provided' do
        expect(@amadeus.reference_data.location('ALHR')).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Location
        )
      end
    end

    describe '.reference_data.locations.airports' do
      it 'should return a Airports object' do
        expect(@amadeus.reference_data.locations.airports).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Locations::Airports
        )
      end
    end

    describe '.reference_data.locations.points_of_interest' do
      it 'should return a PointsOfInterest object' do
        expect(@amadeus.reference_data.locations.points_of_interest).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest
        )
      end
    end

    describe '.reference_data.locations.points_of_interest.by_square' do
      it 'should return a PointsOfInterest::BySquare object' do
        expect(@amadeus.reference_data.locations.points_of_interest.by_square).to(
          be_instance_of(
            Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest::BySquare
          )
        )
      end
    end

    describe '.reference_data.locations.point_of_interest' do
      it 'should return a PointOfInterest object' do
        expect(@amadeus.reference_data.locations.point_of_interest('9CB40CB5D0')).to(
          be_instance_of Amadeus::Namespaces::ReferenceData::Locations::PointOfInterest
        )
      end
    end

    describe '.shopping' do
      it 'should return a Safety object' do
        expect(@amadeus.safety).to(
          be_instance_of Amadeus::Namespaces::Safety
        )
      end
    end

    describe '.safety.safety_rated_locations' do
      it 'should return a SafetyRatedLocations object' do
        expect(@amadeus.safety.safety_rated_locations).to(
          be_instance_of Amadeus::Namespaces::Safety::SafetyRatedLocations
        )
      end
    end

    describe '.safety.safety_rated_location' do
      it 'should return a SafetyRatedLocation object' do
        expect(@amadeus.safety.safety_rated_location('CXXXX')).to(
          be_instance_of Amadeus::Namespaces::Safety::SafetyRatedLocation
        )
      end
    end

    describe '.safety.safety_rated_locations.by_square' do
      it 'should return a BySquare object' do
        expect(@amadeus.safety.safety_rated_locations.by_square).to(
          be_instance_of Amadeus::Namespaces::Safety::SafetyRatedLocations::BySquare
        )
      end
    end

    describe '.shopping' do
      it 'should return a Shopping object' do
        expect(@amadeus.shopping).to(
          be_instance_of Amadeus::Namespaces::Shopping
        )
      end
    end

    describe '.shopping.flight_destinations' do
      it 'should return a FlightDestinations object' do
        expect(@amadeus.shopping.flight_destinations).to(
          be_instance_of Amadeus::Namespaces::Shopping::FlightDestinations
        )
      end
    end

    describe '.shopping.flight_offers_search' do
      it 'should return a FlightOffersSearch object' do
        expect(@amadeus.shopping.flight_offers_search).to(
          be_instance_of Amadeus::Namespaces::Shopping::FlightOffersSearch
        )
      end
    end

    describe '.shopping.flight_offers_search.prediction' do
      it 'should return a Prediction object' do
        expect(@amadeus.shopping.flight_offers_search.prediction).to(
          be_instance_of Amadeus::Namespaces::Shopping::FlightOffersSearch::Prediction
        )
      end
    end

    describe '.shopping.flight_dates' do
      it 'should return a FlightDates object' do
        expect(@amadeus.shopping.flight_dates).to(
          be_instance_of Amadeus::Namespaces::Shopping::FlightDates
        )
      end
    end

    describe '.shopping.hotel_offers' do
      it 'should return a HotelOffers object' do
        expect(@amadeus.shopping.hotel_offers).to(
          be_instance_of Amadeus::Namespaces::Shopping::HotelOffers
        )
      end
    end

    describe '.shopping.hoteloffersByHotel' do
      it 'should return a HotelOffersByHotel object' do
        expect(@amadeus.shopping.hotel_offers_by_hotel).to(
          be_instance_of Amadeus::Namespaces::Shopping::HotelOffersByHotel
        )
      end
    end

    describe '.shopping.hoteloffer' do
      it 'should return a HotelOffer object' do
        expect(@amadeus.shopping.hotel_offer('123')).to(
          be_instance_of Amadeus::Namespaces::Shopping::HotelOffer
        )
      end
    end

    describe '.booking.hotel_bookings' do
      it 'should return a HotelBookings object' do
        expect(@amadeus.booking.hotel_bookings).to(
          be_instance_of Amadeus::Namespaces::Booking::HotelBookings
        )
      end
    end

    describe '.travel' do
      it 'should return a Travel object' do
        expect(@amadeus.travel).to(be_instance_of Amadeus::Namespaces::Travel)
      end
    end

    describe '.travel.predictions.flight_delay' do
      it 'should return a Predictions object' do
        expect(@amadeus.travel.predictions.flight_delay).to(
          be_instance_of(
            Amadeus::Namespaces::Travel::Predictions::FlightDelay
          )
        )
      end
    end

    describe '.travel.predictions.trip_purpose' do
      it 'should return a AirTraffic object' do
        expect(@amadeus.travel.predictions.trip_purpose).to(
          be_instance_of(
            Amadeus::Namespaces::Travel::Predictions::TripPurpose
          )
        )
      end
    end

    describe '.airport.predictions.on_time' do
      it 'should return a Prediction object' do
        expect(@amadeus.airport.predictions.on_time).to(
          be_instance_of(
            Amadeus::Namespaces::Airport::Predictions::OnTime
          )
        )
      end
    end

    describe '.travel.analytics' do
      it 'should return a Analytics object' do
        expect(@amadeus.travel.analytics).to(
          be_instance_of Amadeus::Namespaces::Travel::Analytics
        )
      end
    end

    describe '.travel.analytics.air_traffic' do
      it 'should return a AirTraffic object' do
        expect(@amadeus.travel.analytics.air_traffic).to(
          be_instance_of(
            Amadeus::Namespaces::Travel::Analytics::AirTraffic
          )
        )
      end
    end

    describe '.travel.analytics.air_traffic.traveled' do
      it 'should return a Traveled object' do
        expect(@amadeus.travel.analytics.air_traffic.traveled).to(
          be_instance_of(
            Amadeus::Namespaces::Travel::Analytics::AirTraffic::Traveled
          )
        )
      end
    end

    describe '.travel.analytics.air_traffic.booked' do
      it 'should return a Booked object' do
        expect(@amadeus.travel.analytics.air_traffic.booked).to(
          be_instance_of(
            Amadeus::Namespaces::Travel::Analytics::AirTraffic::Booked
          )
        )
      end
    end

    describe '.travel.analytics.air_traffic.busiest-period' do
      it 'should return a BusiestPeriod object' do
        expect(@amadeus.travel.analytics.air_traffic.busiest_period).to(
          be_instance_of(
            Amadeus::Namespaces::Travel::Analytics::AirTraffic::BusiestPeriod
          )
        )
      end
    end

    describe '.e_reputation' do
      it 'should return a EReputattion object' do
        expect(@amadeus.e_reputation).to(
          be_instance_of Amadeus::Namespaces::EReputation
        )
      end
    end

    describe '.e_reputation.hotel_sentiments' do
      it 'should return a HotelSentiments object' do
        expect(@amadeus.e_reputation.hotel_sentiments).to(
          be_instance_of(
            Amadeus::Namespaces::EReputation::HotelSentiments
          )
        )
      end
    end
  end
end
