require 'spec_helper'

RSpec.describe Amadeus::Response::Pagination do
  before do
    @http_response = double('Response')

    @request = double('Amadeus::Request')

    allow_any_instance_of(Amadeus::Response).to receive(:log_response)
    allow_any_instance_of(Amadeus::Response).to receive(:parse_response)
    @response = Amadeus::Response.new(@http_response, @request)
  end

  %w[next previous last first].each do |key|
    describe "Amadeus::Response.#{key}" do
      it "should create a new request with the #{key} page and call it" do
        expect(@request).to receive(:merge).with(page: { offset: 1 })
                                           .and_return(@request)
        expect(@request).to receive(:call)

        expect(@response).to receive(:json).and_return(
          'meta' => { 'links' => { key => 'http://foo.com?page[offset]=1' } }
        )

        expect(@response.send(key.to_sym)).to be_instance_of(Amadeus::Response)
      end

      it 'should return nil if there is no next page' do
        expect(@request).not_to receive(:merge)
        expect(@request).not_to receive(:call)

        expect(@response).to receive(:json).and_return(
          'meta' => { 'links' => {} }
        )

        expect(@response.send(key.to_sym)).to be_nil
      end
    end
  end
end
