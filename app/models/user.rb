class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def generate_jwt
       payload = { user_id: self.id, exp: 24.hours.from_now.to_i }
       JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
  end

end
