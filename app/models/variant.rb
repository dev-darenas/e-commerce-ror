class Variant < ApplicationRecord
  belongs_to :store
  belongs_to :product

  has_many :option_value_variants
  has_many :option_values, through: :option_value_variants

  delegate :name, :name=, :description, :slug, to: :product

  def options_text
    option_values.map(&:value_text).join(', ')
  end
end
