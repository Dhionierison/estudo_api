class UsersController < ApplicationController
  before_action :authenticate_user_from_token!, except:[:login, :create]

  def create
    user = User.new(user_params)
    if user.save
      token = user.generate_jwt
      render json: { user: user, token: token }, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def buscar_usuarios
    render json: User.all
  end  

  def login
    user = User.find_by(email: params[:user][:email])
    if user&.valid_password?(params[:user][:password])
      token = user.generate_jwt
      render json: { user: user, token: token }, status: :ok
    else
      render json: { error: 'E-mail ou senha inválidos' }, status: :unauthorized
    end
  end


  private

  # def produto_params
  #   params.require(:produto).permit(:email, :password,)
  # end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
