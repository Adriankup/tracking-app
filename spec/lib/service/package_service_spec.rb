# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service::PackageService do
  context 'Package Service' do
    let!(:package) { create(:package) }

    it 'should create a packages' do
      file = fixture_file_upload(Rails.root.join('spec/fixtures/files/shipments_data.json'),
                                 'application/json')

      Service::PackageService.new.create_packages(file: file)

      expect(Package.count).to eq(5)
    end

    it 'should update a package' do
      package.parcel = 'fedex'
      package.guide_number = '449044304137821'
      expect(Service::PackageService.new.update_package(package)).to be(true)
    end

    it 'should destroy a package' do
      expect(Service::PackageService.new.delete_package(package)).to be(package)
    end
  end
end
