class OptionType < ApplicationRecord
  has_many :product_option_types, dependent: :destroy, inverse_of: :option_type
  has_many :products, through: :product_option_types
  has_many :option_values

  belongs_to :store
  accepts_nested_attributes_for :option_values,
    reject_if: lambda {
      |attributes| attributes['name'].blank?
    },
    allow_destroy: true

end
