class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :mfr
      t.text :description
      t.decimal :price
      t.decimal :tax
      t.integer :quantity
      t.string :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
