module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end
  end
  module SignInHelpers
    def signin
      @user = FactoryGirl.build :user
      params = { email: @user.email,
                 password: @user.password,
                 name: @user.name }
      post :signup, params
      @token = json["token"]
    end

    def token
      @token
    end
  end
end
