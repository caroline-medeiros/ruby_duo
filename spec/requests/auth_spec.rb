require 'rails_helper'

RSpec.describe "Autenticação", type: :request do
  let!(:user) { User.create(name: "Test User", email: "teste@login.com", password: "123") }

  describe "POST /login" do
    context "com credenciais válidas" do
      it "retorna um token de autenticação" do
        post "/login", params: { email: "teste@login.com", password: "123" }

        expect(response).to have_http_status(:ok)

        json_response = JSON.parse(response.body)
        expect(json_response).to include("token")
        expect(json_response["user"]["email"]).to eq("teste@login.com")
      end
    end

    context "com senha incorreta" do
      it "retorna erro de não autorizado" do
        post "/login", params: { email: "teste@login.com", password: "senha_errada" }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
