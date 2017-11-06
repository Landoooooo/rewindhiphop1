Rails.application.routes.draw do

  devise_for :admins
  resources :posts do
  	resources :comments
  end

  mount Ckeditor::Engine => '/ckeditor'
  	
  get 'home', to: 'posts#index', as: 'home'

  get 'tapes', to: 'static_pages#tapes', as: 'tapes'

  get 'user', to: 'static_pages#user', as: 'user'
  
  devise_for :users do 
  
	  get 'users/sign_in', to: 'devise/sessions#new'

	  get 'users/sign_in', to: 'devise/sessions#create'

	  get 'users/sign_out' => 'devise/sessions#destroy'

	  get 'users/password/new', to: 'devise/passwords#new'

	  get 'users/password/edit', to: 'devise/passwords#edit'

	  get 'users/cancel', to: 'devise/registrations#cancel'

	  get 'users/sign_up', to: 'devise/registrations#new'

	  get 'users/edit', to: 'devise/registrations#edit'

	end

  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
