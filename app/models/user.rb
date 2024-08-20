# frozen_string_literal: true

# Product description
class User < ApplicationRecord
  # relations
  has_many :products, dependent: :destroy

  # validations
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :username, presence: true, uniqueness: true
end
