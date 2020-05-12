Rails.application.routes.draw do

  root 'static_pages#index'
  get 'static_pages/index'
  get 'static_pages/secret'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
