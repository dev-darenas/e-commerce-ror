class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :product_option_types
  has_many :option_types, through: :product_option_type
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
  delegate :price, :price=, to: :find_or_build_master

  def find_or_build_master
    master || build_master(store: self.store)
  end

  private

  def master
    super || variants_including_master.find_by(is_master: true)
  end

  def save_master
    find_or_build_master.save!
  end
end
