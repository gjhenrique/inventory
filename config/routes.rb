ControleEstoque::Application.routes.draw do

  devise_for :users
  resources :items
  
  root 'items#index'
end
