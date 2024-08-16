# frozen_string_literal: true

# Product description
class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
