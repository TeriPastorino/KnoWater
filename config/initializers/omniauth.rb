Rails.application.config.middleware.use OmniAuth::Builder do
  #from intridea/omniauth
  #provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
  #provider :facebook, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  
end