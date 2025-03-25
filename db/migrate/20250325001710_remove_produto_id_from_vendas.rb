class RemoveProdutoIdFromVendas < ActiveRecord::Migration[6.1]
  def change
    # Método seguro que não depende do nome exato
    remove_foreign_key :vendas, column: :produto_id
    remove_column :vendas, :produto_id, :bigint
  end
end