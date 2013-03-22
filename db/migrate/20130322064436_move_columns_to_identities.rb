class MoveColumnsToIdentities < ActiveRecord::Migration
  def up
  	User.all.each do |user|
  	  Identity.create(uid: user.uid, 
    	     provider: user.provider, 
    	     user_id: user.id,
    	     link: user.link,
    	     image: user.image,
    	     name: user.name
    	)
  	end
  end
end
