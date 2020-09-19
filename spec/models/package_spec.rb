# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Package, type: :model do
  let!(:package) { create(:package) }

  context 'package should be a valid instance' do
    it do
      expect(package).to be_valid
    end
  end

  it 'parcel should be present' do
    package.parcel = nil
    expect(package).to_not be_valid
  end

  it 'status should be present' do
    package.status = nil
    expect(package).to_not be_valid
  end

  it 'guide_number should be present' do
    package.guide_number = nil
    expect(package).to_not be_valid
  end

  it 'description should be present' do
    package.description = nil
    expect(package).to_not be_valid
  end

end
