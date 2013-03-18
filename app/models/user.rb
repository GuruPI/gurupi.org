class User < ActiveRecord::Base
  has_many :roles
  has_many :posts

  include UserRoles

  def self.create_with_omniauth(auth)
    if auth['provider'] == 'github'
      create! do |user|
        user.provider = auth["provider"]
        user.uid      = auth["uid"]
        user.name     = auth["info"]["name"]
        user.email    = auth["info"]["email"]
        user.image    = auth["info"]["image"]
        user.link     = auth.try(:[], 'info').try(:[], 'urls').try(:[], 'GitHub')
      end
    else
      create! do |user|
        user.provider = auth["provider"]
        user.uid      = auth["uid"]
        user.name     = auth["info"]["name"]
        user.email    = auth["info"]["email"]
        user.image    = auth["info"]["image"]
        user.link     = auth.try(:[], 'info').try(:[], 'urls').try(:[], 'Facebook')
        if auth["extra"] && auth["extra"]["user_hash"]
          user.gender   = auth["extra"]["user_hash"]["gender"]
          user.timezone = auth["extra"]["user_hash"]["timezone"]
        end
      end
    end
  end
end

