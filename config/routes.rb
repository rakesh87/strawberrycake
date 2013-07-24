Strawberrycake::Application.routes.draw do

  root :to => "posts#index"
  resources :posts, only: [:new, :show, :destroy, :create, :edit, :update]

end
