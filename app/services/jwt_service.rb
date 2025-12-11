require "jwt"

class JwtService
  SECRET_KEY = Rails.application.secret_key_base
  def self.encode(payload)
    payload[:exp] = 24.hours.from_now.to_i

    JWT.encode(payload, SECRET_KEY, "HS256")
  end

  def self.decode(token)
    begin
      decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: "HS256" })[0]
      HashWithIndifferentAccess.new(decoded)
    rescue
      nil
    end
  end
end
