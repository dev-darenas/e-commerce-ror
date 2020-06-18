class CreateProductOptionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_option_types do |t|
      t.belongs_to :product
      t.belongs_to :option_types

      t.timestamps
    end
  end
end
