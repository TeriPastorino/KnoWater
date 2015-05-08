Rails.application.config.middleware.use OmniAuth::Builder do
  #from intridea/omniauth
  provider :developer unless Rails.env.production?
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  #provider :facebook, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  
end