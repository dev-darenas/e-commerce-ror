class Variant < ApplicationRecord
  belongs_to :store
  belongs_to :product

  has_many :option_value_variants
  has_many :option_values, through: :option_value_variants
  has_many :images, as: :imageable

  delegate :name, :name=, :description, :slug, to: :product

  def options_text
    name_variant = option_values.map(&:value_text).join(', ')
    return name_variant.blank? ? name : name_variant
  end
end
