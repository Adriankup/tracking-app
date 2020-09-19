# frozen_string_literal: true

class Json < Formatter
  def self.to_format(file)
    file = File.read(file)
    JSON.parse(file)
  end
end
