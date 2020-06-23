class Store < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :users
  has_many :products
  has_many :variants
  has_many :option_types
  has_many :properties
end
