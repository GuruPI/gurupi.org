class Comment < ActiveRecord::Base
  belongs_to :identity
  belongs_to :post
end
