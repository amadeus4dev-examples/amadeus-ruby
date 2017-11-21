require 'spec_helper'

RSpec.describe Amadeus::Client::Base do
  before do
    @amadeus = Amadeus::Client.new(
      api_key: '123',
      api_secret: '234'
    )
  end

  it 'should exist' do
    expect(Amadeus::Client::Base).not_to be nil
  end

  describe '.initialize' do
    it 'should return a new namespaced client with the right params' do
      expect(Amadeus::Client::Base.new(@amadeus)).to(
        be_instance_of(Amadeus::Client::Base)
      )
    end

    it 'should raise an error without a client' do
      expect{ Amadeus::Client::Base.new }.to(
        raise_error(ArgumentError)
      )
    end

    it 'should raise an error with a nil client' do
      expect{ Amadeus::Client::Base.new }.to(
        raise_error(ArgumentError)
      )
    end

    it 'should raise an error with the wrong kind of client' do
      expect{ Amadeus::Client::Base.new('test') }.to(
        raise_error(ArgumentError)
      )
    end
  end

  describe 'with an instance' do
    before do
      @base = Amadeus::Client::Base.new(@amadeus)
    end

    describe '.client' do
      it 'should allow access to the client' do
        expect(@base.client).to equal(@amadeus)
      end
    end
  end
end
