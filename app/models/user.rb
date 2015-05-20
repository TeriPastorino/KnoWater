qclass User < ActiveRecord::Base
  has_many :activities
  validates :uid, presence: true
  validates :provider, presence: true, inclusion: {in: %w(twitter), allow_blank: true}
  validates :user_id, presence: true 
  def self.find_or_create_by_omniauth(auth_hash)
    # check to see if a user exists with the uid
    user = User.find_by(uid: auth_hash[:uid])
    # if it does, return that use
    if user.present?
      user
    else
    # if it doesnt, create the user with the providr, uid, info['name']
      create do |user|
      user.provider = (auth_hash[:provider])
      user.uid = (auth_hash[:uid])
      user.name = (auth_hash[:info][:name])
     end 
    end
  end
end
#extra to do
#Login with FB
#login wihtout social media