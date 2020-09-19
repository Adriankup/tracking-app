# frozen_string_literal: true

class Tracking::Finder
  STRATEGIES = {
    fedex: Tracking::Strategy::Fedex,
    dhl: Tracking::Strategy::Dhl
  }.freeze

  def initialize(carrier)
    @strategy = STRATEGIES[carrier].new
  end

  def track(tracking_number)
    @strategy.track(tracking_number)
  end
end
