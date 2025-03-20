class ProdutosController < ApplicationController
  def index
    @q = Produto.ransack(params[:q])
    render json: @q.result
  end

  def create
    produto = Produto.new(produto_params)
    if produto.save
      render json: produto, status: :created
    else
      render json: {errors: produto.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private
  def produto_params
    params.require(:produto).permit(:nome, :preço, :estoque)
  end
end
