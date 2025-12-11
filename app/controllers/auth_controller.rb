class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, "MINHA_SENHA_SECRETA_DO_RAILS", "HS256")

      render json: { token: token, user: { name: user.name, email: user.email } }
    else
      render json: { error: "Email ou senha invalidos" }, status: :unauthorized
    end
  end
end
