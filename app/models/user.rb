class User < ActiveRecord::Base
  has_many :roles
  has_many :posts

  attr_reader :role

  def role_symbols
    (roles || []).map { |r| r.title.to_sym }
  end

  def admin?
    role_symbols.include?(:admin)
  end

  def member?
    !admin? && role_symbols.include?(:member)
  end

  def guest?
    !admin? && !member?
  end

  def role
    @role = admin? ? "admin" : (member? ? "member" : "guest")
  end

  def change_role(value)
    role = Role.create(:title => value)
    self.roles = [role]
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid      = auth["uid"]
      user.name     = auth["user_info"]["name"]
      user.email    = auth["user_info"]["email"]
      user.image    = auth["user_info"]["image"]
      if auth["extra"] && auth["extra"]["user_hash"]
        user.link     = auth["extra"]["user_hash"]["link"]
        user.gender   = auth["extra"]["user_hash"]["gender"]
        user.timezone = auth["extra"]["user_hash"]["timezone"]
      end
    end
  end
end
