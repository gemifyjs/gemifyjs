class User < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid

  has_many :jems
  
  def self.find_or_create_from_auth_hash(auth_hash)
    User.where(:provider => auth_hash['provider'], :uid => auth_hash['uid']).first || User.create_with_auth(auth_hash)
  end

  def self.create_with_auth(auth_hash)
    create! do |user|
      user.provider = auth_hash['provider']
      user.uid = auth_hash['uid']
      if auth_hash['info']
        user.name = auth_hash['info']['name'] || ""
        user.email = auth_hash['info']['email'] || ""
        user.login = auth_hash['info']['nickname'] || ""
      end
    end
  end
end
