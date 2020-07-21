class OptionValue < ApplicationRecord
  belongs_to :option_type

  has_many :option_value_variants
  has_many :variants, through: :option_value_variants
end
