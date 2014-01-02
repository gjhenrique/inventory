ControleEstoque::Application.routes.draw do

  devise_for :users, controllers: {:registrations => "registrations"}
 
 	devise_scope :user do
		# match 'user', to: 'registrations#index', via: [:get], as: :users
		# match 'user/:id', to: 'registrations#destroy_user',  via: [:delete], as: :user
		resources :registrations, only: [:index, :destroy]
	end
  resources :items

  root 'items#index'
end
