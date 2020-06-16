class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.boolean :is_master
      t.references :store, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :cost_price
      t.string :sku

      t.timestamps
    end
  end
end
