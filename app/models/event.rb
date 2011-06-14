class Event < ActiveRecord::Base
  before_save :slugify
  validates :name, :presence => true, :uniqueness => true

  def to_param
    slug
  end

  private
  def slugify
    self.slug = name.parameterize.to_s
  end

end

