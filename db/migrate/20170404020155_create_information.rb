class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.text :contact
      t.text :about

      t.timestamps
    end
  end
end
