class Post < ActiveRecord::Base
  before_save :slugify

  def to_param
    slug
  end

  private
  def slugify
    self.slug = title.parameterize.to_s
  end
end
