class OptionType < ApplicationRecord
    has_many :product_option_type
    has_many :product, through: :product_option_type
    #belongs_to :store
end
