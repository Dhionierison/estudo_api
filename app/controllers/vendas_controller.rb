class VendasController < ApplicationController
  before_action :authenticate_user_from_token!
  before_action :set_product, only: [:create]

  def create
    @venda = @current_user.vendas.new(
      quantidade: venda_params[:quantidade],
      product_id: @product.id
    )
  
    if @venda.save
      render json: { message: 'Venda realizada com sucesso!', venda: @venda }, status: :created
    else
      render json: { error: @venda.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_product
    # Busca o product_id tanto do params raiz quanto do hash venda
    product_id = params[:product_id] || params.dig(:venda, :product_id)
    
    unless product_id.present?
      return render json: { error: "product_id é obrigatório" }, status: :unprocessable_entity
    end

    @product = Product.find_by(id: product_id)
    
    unless @product
      render json: { 
        error: "Produto não encontrado",
        product_id: product_id,
        existing_ids: Product.pluck(:id)
      }, status: :not_found
    end
  end

  def venda_params
    # Permite apenas quantidade, pois product_id já é tratado no set_product
    params.require(:venda).permit(:quantidade)
  end
end