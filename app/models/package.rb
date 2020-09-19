# frozen_string_literal: true

class Package < ApplicationRecord
  attr_accessor :file
  validates :parcel, :status, :guide_number, :description, presence: true
end
