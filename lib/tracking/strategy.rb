# frozen_string_literal: true

class Tracking::Strategy
  protected

  def track
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
