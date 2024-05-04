class Article < ApplicationRecord
  before_save :generate_slug
  validates :title, presence: true, uniqueness: true

  def generate_slug
    return unless title.present?

    # puts title.parameterize
    puts title

    self.slug = title
  end

  # def to_param
  #   slug
  # end

  has_many :tag_articles
  has_many :tags, through: :tag_articles
end
