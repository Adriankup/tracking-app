require 'strategies/tracking'
require 'strategies/fedex_track'
require 'strategies/dhl'

class Finder
  STRATEGIES = {
    'FEDEX' => FedexTrack,
    'DHL' => Dhl
  }.freeze

  def initialize(carrier)
    @carrier = carrier
    @strategy = STRATEGIES[@carrier].new
  end

  def trace(tracking_number)
    @strategy.find(tracking_number)
  end

end
