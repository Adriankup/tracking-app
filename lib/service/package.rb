# frozen_string_literal: true

class Service::Package
  def create(params)
    shipping_guides = FileFormatter.new(params[:file]).to_format
    Package.transaction do
      shipping_guides.each do |guide|
        package = Tracking::Finder.new(guide[:carrier].downcase.to_sym).track(guide[:tracking_number].strip)
        package.save!
      end
    end
  end

  def update(package)
    package = Tracking::Finder.new(package.parcel.downcase.to_sym).track(package.guide_number)
    package.save!
  end

  def delete(package)
    package.destroy!
  end

end
