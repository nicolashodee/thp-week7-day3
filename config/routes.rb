Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'events#index'
  resources :events do 
    resources :attendances, only: [:new, :create, :index]
  end

  resources :users

  # --- Routes for static_pages_controller ---
  resources :static_pages
  get 'static_pages/index'
  get 'static_pages/secret'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/explain', to: 'static_pages#explain'

  
end
