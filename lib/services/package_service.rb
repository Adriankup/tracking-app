# frozen_string_literal: true

require 'core/formatter'
require 'core/json'
require 'core/finder'

class PackageService
  def create_packages(params)
    shipping_guides = Formatter.new(params[:file]).to_format(Json)
    Package.transaction do
      shipping_guides.each do |guide|
        package = Finder.new(guide['carrier']).trace(guide['tracking_number'])
        package.save!
      end
    end
  end
end
