# frozen_string_literal: true

# Product description
class Product < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :photo, presence: true
end
