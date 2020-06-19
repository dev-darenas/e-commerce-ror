class OptionType < ApplicationRecord
    has_many :product_option_types
    has_many :products, through: :product_option_type
    belongs_to :store
end
