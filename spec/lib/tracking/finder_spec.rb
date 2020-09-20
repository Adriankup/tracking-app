# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tracking::Finder do
  context 'Tracking Finder' do
    it 'should find a fedex package' do
      tracking_info = Tracking::Finder.new(:fedex).track('123456789012')
      expect(tracking_info).to be_an_instance_of(Package)
      expect(tracking_info[:description]).to eq 'Delivered'
      expect(tracking_info[:status]).to eq 'Delivered'
    end

    it 'should return a fedex package with error' do
      tracking_info = Tracking::Finder.new(:fedex).track('039813852990618')
      expect(tracking_info).to be_an_instance_of(Package)
      expect(tracking_info[:description]).to eq 'This tracking number cannot be found. Please check the number or contact the sender.'
      expect(tracking_info[:status]).to eq 'Error'
    end
  end
end
