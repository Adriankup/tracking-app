#require 'services/package_service'

class PackagesController < ApplicationController
  def new
    @package = Package.new
  end

  def create
    respond_to do |format|
      Service::PackageService.new.create_packages(package_params)
      format.html { redirect_to welcome_path, alert: t('controller.uploaded') }
    #rescue StandardError => e
     # format.html { redirect_to new_package_path, alert: e.message }
    end
  end

  private

  def package_params
    params.require(:package).permit(:file)
  end

end
