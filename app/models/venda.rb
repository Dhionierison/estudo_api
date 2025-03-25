
class Venda < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantidade, presence: true, numericality: { greater_than: 0 }
  

  before_create :debitar_estoque

  private

  def debitar_estoque
    if self.quantidade >= product.quantidade  
      errors.add(:quantidade, "O produto não possui estoque suficiente.")
      throw :abort # Impede que o registro seja salvo
    end
    product.decrement!(:quantidade, quantidade)
  end
end