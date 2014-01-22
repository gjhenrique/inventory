ControleEstoque::Application.routes.draw do

  resources :orders

  devise_for :users, controllers: {registrations: "registrations"}
  
 	devise_scope :user do
		resources :users, only: [:index, :destroy], controller: "registrations"
	end
  resources :items

  root 'items#index'
end
