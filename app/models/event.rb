class Event < ActiveRecord::Base
  before_save :slugify
  validates :name, presence: true, uniqueness: true
  has_many :lectures, dependent: :destroy, order: 'relative_votes desc, negative_vote asc'
  has_many :certificates, :dependent => :destroy

  def to_param
    slug
  end
  
  def user_go?(user_id)
    Certificate.joins(:event).where("user_id = ? and event_id = ? and go = ?", user_id, self.id, true).present? ? true : false
  end
  
  def going
    Certificate.where("event_id = ? and go = ?", self.id, true)
  end
  
  def confirmed
    Certificate.where("event_id = ? and confirmed = ?", self.id, true)
  end

  private
  def slugify
    self.slug = name.parameterize.to_s
  end

end

