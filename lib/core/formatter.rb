# frozen_string_literal: true

class Formatter
  def initialize(file)
    @file = file
  end

  def to_format(formatter = Json)
    formatter.to_format(@file)
  end
end
