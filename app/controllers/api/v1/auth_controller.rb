class Api::V1::AuthController < ApplicationController
  def signup
    user = User.create(name: params[:name], password_digest: password,
    email: params[:email].downcase)
    if user.save
      login
    else
      render json: user.errors.full_messages, status: 401
    end
  end
  def login
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      render json: { message: "You are logged in." }, status: 200
      session[:user_id] = user.id
    else
      render json:
      { message: "You must have entered an incorrect Email or Password" },
      status: 417
    end
  end
  def logout
  end
  def destroy
    user = User.destroy(params[:id])
    head 204
  end

  private
    def password
      unless params[:password].blank?
        BCrypt::Password.create(params[:password], :cost => 5)
      else
        nil
      end
    end
end
