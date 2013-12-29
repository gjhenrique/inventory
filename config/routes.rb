ControleEstoque::Application.routes.draw do

  devise_for :users, controllers: {:registrations => "registrations"} 
  resources :items
	
  root 'items#index'
end
