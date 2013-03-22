class Identity < ActiveRecord::Base
  belongs_to :user

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth, user)
    create(uid: auth['uid'], 
    	     provider: auth['provider'], 
    	     user_id: user.id,
    	     link: auth.try(:[], 'info').try(:[], 'urls').try(:first).try(:last),
    	     image: auth["info"]["image"],
    	     name: auth["info"]["name"]
    )
  end

end
