class ProdutoSerializer < ActiveModel::Serializer
  attributes :id, :nome, :preço, :estoque
end
