class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_one_attached :article_picture

  belongs_to :user
end
