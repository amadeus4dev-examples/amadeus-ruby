# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Request::Hash do
  before do
    @request = Amadeus::Request.new(host: 'example.com', params: {})
  end

  describe 'Amadeus::Request.flatten_keys' do
    it 'should flatten keys of a hash for use in GET params' do
      params = {
        test: 'foo',
        foo: nil,
        bar: [
          'test'
        ],
        page: {
          offset: 1
        }
      }

      expect(@request.send(:flatten_keys, params)).to eql(
        test: 'foo',
        :'bar[]' => 'test',
        :'page[offset]' => 1
      )
    end
  end
end
