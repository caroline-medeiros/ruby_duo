require "jwt"

class JwtService
  HMAC_SECRET = Rails.application.credentials.secret_key_base || "secret_key_base"
  ALGORITHM = "HS256"
  EXPIRATION = 24.hours

  def self.encode(payload)
    payload[:exp] = EXPIRATION.from_now.to_i
    JWT.encode(payload, HMAC_SECRET, ALGORITHM)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITHM })[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError
    nil
  end
end
