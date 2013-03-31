class Event < ActiveRecord::Base
  before_save :slugify
  validates :name, presence: true, uniqueness: true
  has_many :lectures, dependent: :destroy, order: 'relative_votes desc, negative_vote asc'
  has_many :certificates, :dependent => :destroy

  def to_param
    slug
  end
  
  def user_go?(user_id)
    certificates.going.where(:user_id => user_id).any?
  end
  
  def going
    certificates.going
  end
  
  def confirmed
    certificates.confirmed
  end

  private
  def slugify
    self.slug = name.parameterize.to_s
  end
end

