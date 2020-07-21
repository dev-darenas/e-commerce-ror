class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :product_option_types, dependent: :destroy, inverse_of: :product
  has_many :option_types, through: :product_option_types
  accepts_nested_attributes_for :product_option_types,
    reject_if: lambda {
      |a| a[:option_type_id].blank?
    }, allow_destroy: true

  has_many :product_propertys
  has_many :propertys, through: :product_propertys
  belongs_to :store
  after_save :save_master

  has_one :master,
          -> { where is_master: true },
          inverse_of: :product,
          class_name: 'Variant',
          autosave: true

  has_many :variants,
            -> { where is_master: false },
            inverse_of: :product,
            class_name: 'Variant'

  has_many :variants_including_master,
            inverse_of: :product,
            class_name: 'Variant'

  delegate :sku, :sku=, to: :find_or_build_master
  delegate :cost_price, :cost_price=, to: :find_or_build_master

  def find_or_build_master
    # TODO: this should be the store of the product
    # but with self.store we got error
    master || build_master(store: self.store || Store.first)
  end

  private

  def master
    super || variants_including_master.find_by(is_master: true)
  end

  def save_master
    find_or_build_master.save!
  end
end
