class CreateProductProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :product_properties do |t|
      t.belongs_to :product
      t.belongs_to :property

      t.timestamps
    end
  end
end
