class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = JwtService.encode({ user_id: user.id })

      render json: { token: token, user: { name: user.name, email: user.email } }
    else
      render json: { error: "Email ou senha inválidos" }, status: :unauthorized
    end
  end
end
