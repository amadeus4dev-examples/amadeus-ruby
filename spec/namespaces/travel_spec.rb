# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Travel do
  it 'should exist' do
    expect(Amadeus::Namespaces::Travel).not_to be nil
  end
end

RSpec.describe Amadeus::Namespaces::Booked do
  it 'should exist' do
    expect(Amadeus::Namespaces::Booked).not_to be nil
  end
end

RSpec.describe Amadeus::Namespaces::BusiestPeriod do
  it 'should exist' do
    expect(Amadeus::Namespaces::BusiestPeriod).not_to be nil
  end
end
