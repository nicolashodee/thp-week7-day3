Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  
  #definit la page d'accueil et les routes du model event
  root 'events#index'
  resources :events

  # routes de static pages pour les pages team, secret et contact
  get 'static_pages/index'
  get 'static_pages/secret'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  
end
