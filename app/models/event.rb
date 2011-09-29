class Event < ActiveRecord::Base
  before_save :slugify
  validates :name, presence: true, uniqueness: true
  has_many :lectures, dependent: :destroy, order: 'positive_vote desc'

  def to_param
    slug
  end

  private
  def slugify
    self.slug = name.parameterize.to_s
  end

end

