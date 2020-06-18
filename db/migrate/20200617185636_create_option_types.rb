class CreateOptionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :option_types do |t|
      t.string :name
      t.string :presentation
      t.references :store

      t.timestamps
    end
  end
end
