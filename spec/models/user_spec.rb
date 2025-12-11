require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validações' do
    it 'é válido com nome, email e senha' do
      user = User.new(name: "Teste", email: "teste@exemplo.com", password: "123")
      expect(user).to be_valid
    end

    it 'não é válido sem nome' do
      user = User.new(name: nil, email: "teste@exemplo.com", password: "123")
      expect(user).not_to be_valid
    end

    it 'não é válido sem email' do
      user = User.new(name: "Teste", email: nil, password: "123")
      expect(user).not_to be_valid
    end

    it 'não permite emails duplicados' do
      User.create(name: "User 1", email: "duplicado@teste.com", password: "123")
      user2 = User.new(name: "User 2", email: "duplicado@teste.com", password: "123")
      expect(user2).not_to be_valid
      expect(user2.errors[:email]).to include("has already been taken")
    end
  end

  context 'Segurança' do
    it 'criptografa a senha automaticamente' do
      user = User.create(name: "Seguro", email: "seguro@teste.com", password: "senha_secreta")
      expect(user.password_digest).not_to eq("senha_secreta")
      expect(user.password_digest).to start_with("$2a$")
    end
  end
end
