Strawberrycake::Application.routes.draw do

  root :to => "pages#home"
  resources :posts

  get "/auth/:provider/callback" => "sessions#create", as: :auth_callback
  match "/auth/failure" => "sessions#failure", as: :auth_failure
  delete "/logout" => "sessions#destroy", as: :logout
end
