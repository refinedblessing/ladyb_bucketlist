require "rails_helper"

RSpec.describe Api::V1::AuthController, type: :controller do
  describe "POST #signup" do
    before(:each) do
      @user = FactoryGirl.build :user
    end

    context "when the credentials are correct" do
      before(:each) do
        params = { email: @user.email,
                   password: @user.password,
                   name: @user.name }
        post :signup, params
      end

      it "returns the user record corresponding to the given credentials" do
        expect(json["token"]).not_to eql nil
      end
    end

    context "when the credentials are incorrect" do
      before(:each) do
        params = { email: nil, password: "invalidpassword" }
        post :signup, params
      end

      it "returns a json with an error" do
        expect(json["auth"][0]).to eql "Email can't be blank"
      end

      it "does not return a json with token" do
        expect(json[:token]).to be nil
      end
    end
  end
  describe "POST #login" do
    before(:each) do
      @user = FactoryGirl.build :user
    end

    context "when the credentials are correct" do
      before(:each) do
        signin
      end

      it "returns the user record corresponding to the given credentials" do
        expect(json["token"]).to eql token
      end
    end

    context "when the credentials are incorrect" do
      before(:each) do
        params = { email: "", password: "invalidpassword" }
        post :login, params
      end

      it "returns a json with an error" do
        expect(json["error"]).
          to eql "You entered an incorrect Email or Password"
      end

      it "does not return a json with token" do
        expect(json[:token]).to be nil
      end

      it "responds with a status code of 417" do
        expect(response).to have_http_status 417
      end
    end
  end

  describe "GET #logout" do
    before :each do
      signin
    end

    it "should logout an authenticated user with token contained in HEAD" do
      request.headers[:Authorization] = "#{token}"
      get :logout
      expect(response.status).to be 200
    end

    it "should not logout a user with incorrect token" do
      request.headers[:Authorization] = "rftygh"
      get :logout
      expect(response.status).to be 419
    end

    it "should not logout a user with expired token" do
      token2 = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMi\
      J9.eyJ1c2VyX2lkIjoxLCJlbWFpbCI6ImJiYWFAZ21haW\
      wuY29tIiwiZXhwIjoxNDQ4MjA1NjUxfQ.yJW0k0VPSuZ0x\
      zZxcU9IImf9TjS-iRlVnC1w6aYRPHvEmy8Gtfb-Z49dT6UA\
      DT9up7gWd56QRRJ7Pgc0V4u2ug"
      request.headers[:Authorization] = token2
      get :logout
      expect(response.status).to be 419
    end

    it "should give feedback message after logout" do
      request.headers[:Authorization] = "#{token}"
      get :logout
      expect(json["message"]).to eq "You are logged out."
    end

    it "should not allow access after logout with old token" do
      request.headers[:Authorization] = "#{token}"
      get :logout
      get :logout
      expect(response.status).to be 401
    end
  end

  describe "GET #destroy" do
    before :each do
      signin
    end

    it "should not destroy a user with incorrect token" do
      request.headers[:Authorization] = "rftygh"
      get :destroy
      expect(response.status).to be 419
    end

    it "should delete user information from database" do
      request.headers[:Authorization] = "#{token}"
      get :destroy
      expect(User.all.count).to be 0
    end

    it "should respond with no content" do
      request.headers[:Authorization] = "#{token}"
      get :destroy
      expect(response.status).to be 204
    end
  end
end
