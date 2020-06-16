class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.references :store, null: false, foreign_key: true
      t.datetime :available_on

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
