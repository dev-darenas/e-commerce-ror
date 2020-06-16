class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :slug, 

      t.timestamps
    end
    add_index :stores, :slug, unique: true
  end
end
