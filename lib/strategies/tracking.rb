# frozen_string_literal: true

class Tracking
  def initialize; end

  def find(data)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
