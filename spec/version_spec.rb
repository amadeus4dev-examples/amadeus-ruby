# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus do
  it 'should have a version' do
    expect(Amadeus::VERSION).not_to be nil
  end

  it 'should have a version that matches the gemspec' do
    gemspec = Gem::Specification.load('amadeus.gemspec')
    expect(Amadeus::VERSION).to eq(gemspec.version.to_s)
  end
end
