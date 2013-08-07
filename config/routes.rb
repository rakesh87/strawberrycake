Strawberrycake::Application.routes.draw do

  root :to => "pages#home"
  resources :posts

  match "/auth/:provider/callback" => "sessions#create", as: :auth_callback
  match "/auth/failure" => "sessions#failure", as: :auth_failure
  match "/logout" => "sessions#destroy", as: :logout
end
