# frozen_string_literal: true

# Product description
class Product < ApplicationRecord
  validates :name, :description, :price, :photo, presence: true
end
