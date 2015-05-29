Rails.application.routes.draw do
  
  get 'pages/Information'

  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout
  get 'welcome/about'
  get 'information/info'

  resources :activities
  # don't forget to add the activities#choose action in activities controller
  # and activities/choose.html.haml
  get 'log', to: 'activities#choose', as: :choose_activity
  # log_path("shower")
  # log_path("bath")
  get 'log/:activity_type', to: 'activities#new', as: :log
end
