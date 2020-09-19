# frozen_string_literal: true

class Service::PackageService
  def create_packages(params)
    shipping_guides = FileFormatter.new(params[:file]).to_format
    Package.transaction do
      shipping_guides.each do |guide|
        package = Tracking::Finder.new(guide[:carrier].downcase.to_sym).track(guide[:tracking_number])
        package.save!
      end
    end
  end
end
