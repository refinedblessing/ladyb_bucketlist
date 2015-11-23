# In charge of handling CRUD actions taken on the User model
module Api
  module V1
    class AuthController < ApplicationController
      before_action :authenticate, except: [:login, :signup]

      def signup
        @user = User.create(name: params[:name], password_digest: password,
                            email: params[:email].downcase)
        if @user.save
          login
        else
          render json: @user.errors.full_messages, status: 401
        end
      end

      def login
        @user = User.find_by_email(params[:email].downcase)
        if @user && @user.authenticate(params[:password])
          render json: { token: @user.generate_auth_token }
          @user.update_attribute(:auth_token, true)
        else
          render json:
          { error: "You entered an incorrect Email or Password" }, status: 417
        end
      end

      def logout
        current_user.update_attribute(:auth_token, false) if current_user
        render json: { message: "You are logged out." }, status: 200
      end

      def destroy
        current_user.destroy
        head 204
      end

      private

      def password
        unless params[:password].blank?
          BCrypt::Password.create(params[:password], cost: 5)
        end
      end
    end
  end
end
