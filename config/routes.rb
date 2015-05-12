Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout
  get 'welcome/about'


end
