class User < ActiveRecord::Base
  Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  #provider :facebook, 'CONSUMER_KEY', 'CONSUMER_SECRET'

end
