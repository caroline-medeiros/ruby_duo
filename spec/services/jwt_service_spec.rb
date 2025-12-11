require 'rails_helper'

RSpec.describe JwtService do
  describe '.encode' do
    it 'gera um token válido baseado no payload' do
      payload = { user_id: 1 }
      token = JwtService.encode(payload)

      expect(token).not_to be_nil
      expect(token).to be_a(String)
      expect(token.split('.').size).to eq(3)
    end
  end

  describe '.decode' do
    it 'recupera os dados originais do token' do
      payload = { user_id: 99, name: "Teste" }
      token = JwtService.encode(payload)

      decoded_data = JwtService.decode(token)

      expect(decoded_data['user_id']).to eq(99)
      expect(decoded_data['name']).to eq("Teste")
    end

    it 'retorna nil se o token for inválido' do
      token_falso = "token.falso.123"
      decoded_data = JwtService.decode(token_falso)

      expect(decoded_data).to be_nil
    end
  end
end
