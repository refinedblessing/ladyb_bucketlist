Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: {}, path: "/" do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      resources :bucketlists, except: [:new, :edit] do
        resources :items, except: [:new, :edit]
      end
      get "/begin/callback", to: "bucketlists#begin"
      post "/auth/login", to: "auth#login"
      get "/auth/visit_login", to: "auth#visit_login"
      get "/auth/logout", to: "auth#logout"
      post "/auth/signup", to: "auth#signup"
    end
  end
end
