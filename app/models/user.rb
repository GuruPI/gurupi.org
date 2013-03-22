class User < ActiveRecord::Base
  has_many :roles
  has_many :posts
  has_many :identities, dependent: :destroy

  include UserRoles

  def self.create_with_omniauth(auth)
    create! do |user|
      user.email    = auth["info"]["email"]
      if auth["extra"] && auth["extra"]["user_hash"]
        user.gender   = auth["extra"]["user_hash"]["gender"]
        user.timezone = auth["extra"]["user_hash"]["timezone"]
      end
    end
  end
end

