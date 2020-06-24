class OptionType < ApplicationRecord
    has_many :product_option_types
    has_many :products, through: :product_option_type
    has_many :option_values
    belongs_to :store
    accepts_nested_attributes_for :option_values
end