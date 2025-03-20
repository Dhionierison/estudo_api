class VendaSerializer < ActiveModel::Serializer
  attributes :id, :quantidade, :produto
  belongs_to :user
end  