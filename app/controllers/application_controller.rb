class ApplicationController < ActionController::API
 

  private

  def authenticate_user_from_token!
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      begin
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
        user_id = decoded_token[0]['user_id']
        @current_user = User.find_by(id: user_id)
        unless @current_user
          render json: { error: 'Não autorizado' }, status: :unauthorized
        end
      rescue JWT::DecodeError
        render json: { error: 'Token inválido' }, status: :unauthorized
      end
    else
      render json: { error: 'Token de autenticação ausente' }, status: :unauthorized
    end
  end
end