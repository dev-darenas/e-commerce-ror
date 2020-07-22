class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text :alt
      t.references :imageable, polymorphic: true, null: false
      t.string :image

      t.timestamps
    end
  end
end
