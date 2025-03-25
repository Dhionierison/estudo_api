class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantidade
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
