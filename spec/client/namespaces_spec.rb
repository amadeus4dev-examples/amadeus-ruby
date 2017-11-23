require 'spec_helper'

RSpec.describe Amadeus::Client::Namespaces do
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
          be_instance_of Amadeus::Client::ReferenceData
        )
      end
    end

    describe '.reference_data.urls' do
      it 'should return a Url object' do
        expect(@amadeus.reference_data.urls).to(
          be_instance_of Amadeus::Client::ReferenceData::Urls
        )
      end
    end

    describe '.reference_data.urls.checkin_links' do
      it 'should return a CheckinLinks object' do
        expect(@amadeus.reference_data.urls.checkin_links).to(
          be_instance_of Amadeus::Client::ReferenceData::Urls::CheckinLinks
        )
      end
    end

    describe '.reference_data.locations' do
      it 'should return a Locations object' do
        expect(@amadeus.reference_data.locations).to(
          be_instance_of Amadeus::Client::ReferenceData::Locations
        )
      end
    end

    describe '.reference_data.locations' do
      it 'should return a Airports object' do
        expect(@amadeus.reference_data.locations.airports).to(
          be_instance_of Amadeus::Client::ReferenceData::Locations::Airports
        )
      end
    end

    describe '.shopping' do
      it 'should return a Shopping object' do
        expect(@amadeus.shopping).to(be_instance_of Amadeus::Client::Shopping)
      end
    end

    describe '.shopping.flight_destinations' do
      it 'should return a FlightDestinations object' do
        expect(@amadeus.shopping.flight_destinations).to(
          be_instance_of Amadeus::Client::Shopping::FlightDestinations
        )
      end
    end

    describe '.shopping.flight_offers' do
      it 'should return a FlightOffers object' do
        expect(@amadeus.shopping.flight_offers).to(
          be_instance_of Amadeus::Client::Shopping::FlightOffers
        )
      end
    end

    describe '.shopping.flight_dates' do
      it 'should return a FlightDates object' do
        expect(@amadeus.shopping.flight_dates).to(
          be_instance_of Amadeus::Client::Shopping::FlightDates
        )
      end
    end

    describe '.shopping.hotel_offers' do
      it 'should return a HotelOffers object' do
        expect(@amadeus.shopping.hotel_offers).to(
          be_instance_of Amadeus::Client::Shopping::HotelOffers
        )
      end
    end

    describe '.shopping.hotels' do
      it 'should return a Hotels object' do
        expect(@amadeus.shopping.hotels(123)).to(
          be_instance_of Amadeus::Client::Shopping::Hotels
        )
      end
    end

    describe '.shopping.hotels.offers' do
      it 'should return a Offers object' do
        expect(@amadeus.shopping.hotels(123).offers(234)).to(
          be_instance_of Amadeus::Client::Shopping::Hotels::Offers
        )
      end
    end

    describe '.shopping.hotels.hotel_offers' do
      it 'should return a Offers object' do
        expect(@amadeus.shopping.hotels(123).hotel_offers).to(
          be_instance_of Amadeus::Client::Shopping::Hotels::HotelOffers
        )
      end
    end

    describe '.travel' do
      it 'should return a Travel object' do
        expect(@amadeus.travel).to(be_instance_of Amadeus::Client::Travel)
      end
    end

    describe '.travel.analytics' do
      it 'should return a Analytics object' do
        expect(@amadeus.travel.analytics).to(
          be_instance_of Amadeus::Client::Travel::Analytics
        )
      end
    end

    describe '.travel.analytics.fare_searches' do
      it 'should return a FareSearches object' do
        expect(@amadeus.travel.analytics.fare_searches).to(
          be_instance_of Amadeus::Client::Travel::Analytics::FareSearches
        )
      end
    end

    describe '.travel.analytics.air_traffics' do
      it 'should return a AirTraffics object' do
        expect(@amadeus.travel.analytics.air_traffics).to(
          be_instance_of Amadeus::Client::Travel::Analytics::AirTraffics
        )
      end
    end
  end
end
