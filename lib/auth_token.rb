class AuthToken
  def self.encode(payload)
    payload[:exp] = 24.hours.from_now.to_i
    JWT.encode payload, Rails.application.secrets.secret_key_base, "HS512"
  end

  def self.decode(token)
    decoded = JWT.decode token,
                         Rails.application.secrets.secret_key_base,
                         true, algorithm: "HS512"
    decoded[0]
  rescue
    nil
  end
end
