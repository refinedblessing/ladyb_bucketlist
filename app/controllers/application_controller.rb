class ApplicationController < ActionController::API
  include ActionController::Serialization

  rescue_from NotAuthenticatedError do
    render json: { error: "Not Authorized" }, status: :unauthorized
  end
  rescue_from AuthenticationTimeoutError do
    render json: { error: "Token is expired" }, status: 419
  end

  def current_user
    if decoded_auth_token
      @current_user ||= User.find(decoded_auth_token["user_id"])
    end
  end
  helper_method :current_user

  private
    def authenticate
      if decoded_auth_token["exp"] <= Time.now.to_i
        fail AuthenticationTimeoutError
      elsif !current_user
        fail NotAuthenticatedError
      end
    end
    def decoded_auth_token
      @decoded_auth_token ||= AuthToken.decode(http_auth_header)
    end
    def http_auth_header
      if request.headers["Authorization"].present?
        return request.headers["Authorization"].split(" ").last
      else
        nil
      end
    end
end
