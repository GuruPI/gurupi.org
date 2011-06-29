class Lecture < ActiveRecord::Base
  before_save :slugify
  validates :name, :presence => true, :uniqueness => true
  belongs_to :event
  belongs_to :user

  def to_param
    slug
  end

  private
  def slugify
    self.slug = name.parameterize.to_s
  end

end

