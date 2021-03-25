class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :lead, presence: true

  has_one_attached :article_picture

  belongs_to :user

  def shorten_lead
  	return self.lead.truncate(150)
  end
end
