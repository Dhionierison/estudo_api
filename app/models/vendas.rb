
class Venda < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantidade, presence: true, numericality: { greater_than: 0 }

  after_create :debitar_estoque

  private

  def debitar_estoque
    product.decrement!(:quantidade, quantidade)
  end
end