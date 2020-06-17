class CreateProductOptionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_option_types do |t|

      t.timestamps
    end
  end
end
