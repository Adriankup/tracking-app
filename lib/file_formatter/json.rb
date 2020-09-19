# frozen_string_literal: true

class FileFormatter::Json
  def to_format(file)
    file = File.read(file)
    JSON.parse(file).map { |item| { carrier: item['carrier'], tracking_number: item['tracking_number'] } }
  end
end
