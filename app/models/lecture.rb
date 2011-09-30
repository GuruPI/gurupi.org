class Lecture < ActiveRecord::Base
  before_save :slugify
  validates :name, :presence => true, :uniqueness => true
  belongs_to :event
  belongs_to :user

  before_save :calculate_balance

  scope :ranking, :order => "relative_votes DESC, negative_vote ASC"

  def to_param
    slug
  end

  private
  def slugify
    self.slug = name.parameterize.to_s
  end

  def calculate_balance
    self.relative_votes = positive_vote - negative_vote
  end

end
