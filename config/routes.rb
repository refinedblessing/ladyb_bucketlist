Rails.application.routes.draw do
  use_doorkeeper
  namespace :api,
  defaults: { format: :json }, constraints: { subdomain: "api" }, path: "/"  do
    scope module: :v1,
    constraints: ApiConstraints.new(version: 1, default: true) do
      resources :bucketlists, except: [:new, :edit]
      post "/auth/login", to: "auth#login"
      get "/auth/logout", to: "auth#logout"
      post "/auth/signup", to: "auth#signup"
    end
  end
end
