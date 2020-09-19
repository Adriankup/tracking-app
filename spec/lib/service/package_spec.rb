# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service::Package do
  context 'Package Service' do
    let!(:package) { create(:package) }

    it 'should create a packages' do
      file = fixture_file_upload(Rails.root.join('spec/fixtures/files/shipments_data.json'),
                                 'application/json')

      Service::Package.new.create(file: file)

      expect(Package.count).to eq(5)
    end

    it 'should update a package' do
      package.parcel = 'fedex'
      package.guide_number = '449044304137821'
      expect(Service::Package.new.update(package)).to be(true)
    end

    it 'should destroy a package' do
      expect(Service::Package.new.delete(package)).to be(package)
    end
  end
end
