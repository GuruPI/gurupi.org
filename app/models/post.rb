class Post < ActiveRecord::Base
  belongs_to :user

  before_save :slugify

  def to_param
    slug
  end

  private
  def slugify
    self.slug = title.parameterize.to_s
  end
end
