# frozen_string_literal: true

class Tracking::Strategy::Fedex < Tracking::Strategy
  def track(tracking_number)
    package = Package.find_or_initialize_by(parcel: 'FEDEX', guide_number: tracking_number)
    begin
      tracking_info = client.track(tracking_number: tracking_number).first
      package.status = tracking_info.status
      package.description = tracking_info.events.first.description
    rescue ::Fedex::RateError => e
      package.status = 'Error'
      package.description = e.message
    end
    package
  end

  private

  def client
    @client ||= ::Fedex::Shipment.new(
      key: ENV['FEDEX_KEY'],
      password: ENV['FEDEX_PASSWORD'],
      account_number: ENV['FEDEX_ACCOUNT_NUMBER'],
      meter: ENV['FEDEX_METER'],
      mode: ENV['FEDEX_MODE']
    )
  end
end
