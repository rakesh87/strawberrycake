Strawberrycake::Application.routes.draw do

  root :to => "pages#home"
  resources :posts

end
