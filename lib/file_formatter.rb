# frozen_string_literal: true

class FileFormatter
  def initialize(file)
    @file = file
  end

  def to_format(formatter = FileFormatter::Json.new)
    formatter.to_format(@file)
  end
end
