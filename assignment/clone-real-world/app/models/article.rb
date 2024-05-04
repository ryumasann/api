class Article < ApplicationRecord
  before_save :generate_slug
  validates :title, presence: true, uniqueness: true

  def generate_slug
    return unless title.present?

    self.slug = title
  end

  has_many :tag_articles
  has_many :tags, through: :tag_articles
end
