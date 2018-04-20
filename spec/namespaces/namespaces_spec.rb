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

    describe '.shopping.flight_offers' do
      it 'should return a FlightOffers object' do
        expect(@amadeus.shopping.flight_offers).to(
          be_instance_of Amadeus::Namespaces::Shopping::FlightOffers
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

    describe '.shopping.hotels' do
      it 'should return a Hotels object' do
        expect(@amadeus.shopping.hotel(123)).to(
          be_instance_of Amadeus::Namespaces::Shopping::Hotel
        )
      end
    end

    describe '.shopping.hotels.offers' do
      it 'should return a Offers object' do
        expect(@amadeus.shopping.hotel(123).offer(234)).to(
          be_instance_of Amadeus::Namespaces::Shopping::Hotel::Offer
        )
      end
    end

    describe '.shopping.hotels.hotel_offers' do
      it 'should return a Offers object' do
        expect(@amadeus.shopping.hotel(123).hotel_offers).to(
          be_instance_of Amadeus::Namespaces::Shopping::Hotel::HotelOffers
        )
      end
    end

    describe '.travel' do
      it 'should return a Travel object' do
        expect(@amadeus.travel).to(be_instance_of Amadeus::Namespaces::Travel)
      end
    end

    describe '.travel.analytics' do
      it 'should return a Analytics object' do
        expect(@amadeus.travel.analytics).to(
          be_instance_of Amadeus::Namespaces::Travel::Analytics
        )
      end
    end

    describe '.travel.analytics.fare_searches' do
      it 'should return a FareSearches object' do
        expect(@amadeus.travel.analytics.fare_searches).to(
          be_instance_of Amadeus::Namespaces::Travel::Analytics::FareSearches
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
  end
end
