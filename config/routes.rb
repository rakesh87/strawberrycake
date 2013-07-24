Strawberrycake::Application.routes.draw do

  root :to => "pages#home"
  resources :posts, only: [:index, :new, :show, :destroy, :create, :edit, :update]

end
