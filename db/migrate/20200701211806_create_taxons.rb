class CreateTaxons < ActiveRecord::Migration[6.0]
  def change
    create_table :taxons do |t|
      t.string :name
      t.references :taxonomy, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :taxon, null: false, foreign_key: true
      t.string :permalink

      t.timestamps
    end
  end
end
