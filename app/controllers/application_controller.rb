# Controller from which all other controllers inherit from.
class ApplicationController < ActionController::API
  include ActionController::Serialization
  include BucketlistSetter

  rescue_from NotAuthenticatedError do
    render json: { error: "You are not Authorized" }, status: :unauthorized
  end
  rescue_from AuthenticationTimeoutError do
    render json: { error: "Token has expired" }, status: 419
  end

  def current_user
    if decoded_auth_token
      @current_user ||= User.find(decoded_auth_token["user_id"])
    end
  end
  helper_method :current_user

  private

  def authenticate
    decoded = decoded_auth_token
    user = current_user
    if !decoded || decoded["exp"] <= Time.now.to_i
      fail AuthenticationTimeoutError
    elsif !user || !(user.auth_token)
      fail NotAuthenticatedError
    end
  end

  def decoded_auth_token
    @decoded_auth_token ||= AuthToken.decode(http_auth_header)
  end

  def http_auth_header
    if request.headers["Authorization"].present?
      return request.headers["Authorization"].split(" ").last
    end
  end
end
