class VendasController < ApplicationController
  def create
    venda = current_user.vendas.build(venda_params)
    if venda.save
      render json: venda, status: :created
    else
      render json: {errors: venda.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def venda_params
    params.require(:venda).permit(:quantidade, :produto_id)
  end
end
