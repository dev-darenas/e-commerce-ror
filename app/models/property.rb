class Property < ApplicationRecord
    has_many :product_propertys
    has_many :products, through: :product_propertys
end
