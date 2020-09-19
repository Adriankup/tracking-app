# frozen_string_literal: true

class Package < ApplicationRecord
  attr_accessor :file
  validates :parcel, :description, presence: true, length: { in: 1..255 }
  validates :status, :guide_number, presence: true
end
