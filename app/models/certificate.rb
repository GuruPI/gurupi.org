class Certificate < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :event
  validates :user_id, :presence => true
  validates :event_id, :presence => true
  before_save :generate_token
   
  scope :going, where(:go => true)
  scope :confirmed, where(:confirmed => true)
	
	include GeneratePdf
	
	private
	
	def generate_token
	  self.token = Digest::MD5.hexdigest("#{self.user.identities.first.name}-#{self.user.email}-#{self.event.name}-#{self.event.event_date}")
  end
end
