class CreateVendas < ActiveRecord::Migration[8.0]
  def change
    create_table :vendas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
