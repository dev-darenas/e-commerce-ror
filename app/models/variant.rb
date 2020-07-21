class Variant < ApplicationRecord
  belongs_to :store
  belongs_to :product

  delegate :name, :name=, :description, :slug, to: :product
end
