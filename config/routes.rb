Rails.application.routes.draw do
  get 'activity/index'

  get 'activity/show'

  get 'activity/update'

  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout
  get 'welcome/about'


end
