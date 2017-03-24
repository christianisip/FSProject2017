class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :mfr
      t.text :description
      t.decimal :price
      t.decimal :tax
      t.integer :qty
      t.string :tags
      t.string :string
      t.string :image

      t.timestamps
    end
  end
end
