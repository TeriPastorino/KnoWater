Rails.application.routes.draw do

  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout
  get 'welcome/about'
  get 'pages/saving_tips'
  get 'activities/index'

  resources :activities
  get 'log', to: 'activities#choose', as: :choose_activity
    #log_path("shower")
    #log_path("bath")
  get 'log/:activity_type', to: 'activities#new', as: :log
end
