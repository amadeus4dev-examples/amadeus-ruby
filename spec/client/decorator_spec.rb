# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Client::Decorator do
  before do
    @amadeus = Amadeus::Client.new(
      client_id: '123',
      client_secret: '234'
    )
  end

  it 'should exist' do
    expect(Amadeus::Client::Decorator).not_to be nil
  end

  describe '.initialize' do
    it 'should return a new namespaced client with the right params' do
      expect(Amadeus::Client::Decorator.new(@amadeus)).to(
        be_instance_of(Amadeus::Client::Decorator)
      )
    end

    it 'should raise an error without a client' do
      expect{ Amadeus::Client::Decorator.new }.to(
        raise_error(ArgumentError)
      )
    end

    it 'should raise an error with a nil client' do
      expect{ Amadeus::Client::Decorator.new(nil) }.to(
        raise_error(ArgumentError)
      )
    end
  end

  describe 'with an instance' do
    before do
      @base = Amadeus::Client::Decorator.new(@amadeus)
    end

    describe '.client' do
      it 'should allow access to the client' do
        expect(@base.client).to equal(@amadeus)
      end
    end
  end
end
