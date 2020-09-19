class PackagesController < ApplicationController
  before_action :set_package, only: %i[update destroy]

  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    respond_to do |format|
      Service::PackageService.new.create_packages(package_params)
      format.html { redirect_to packages_path, notice: t('controller.uploaded') }
    rescue StandardError => e
      format.html { redirect_to new_package_path, alert: e.message }
    end
  end

  def update
    respond_to do |format|
      Service::PackageService.new.update_package(@package)
      format.html { redirect_to packages_path, notice: "#{t('controller.updated')}: #{@package.guide_number}" }
    rescue StandardError => e
      format.html { redirect_to packages_path, alert: e.message }
    end
  end

  def destroy
    guide_number = @package.guide_number
    respond_to do |format|
      Service::PackageService.new.delete_package(@package)
      format.html { redirect_to packages_path, notice: "#{t('controller.destroyed')}: #{guide_number}" }
    rescue StandardError => e
      format.html { redirect_to packages_path, alert: e.message }
    end
  end

  private

  def package_params
    params.require(:package).permit(:file)
  end

  def set_package
    @package = Package.find(params[:id])
  end
end
