class AddProductIdToVendas < ActiveRecord::Migration[8.0]
  def change
    add_reference :vendas, :product, null: false, foreign_key: true
  end
end
