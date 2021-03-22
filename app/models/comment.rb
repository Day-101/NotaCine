class Comment < ApplicationRecord
  validates :content, length:{maximum:512}, presence: true


  belongs_to :movie
  belongs_to :user


  def user_is_author?(user)
    self.user == user
  end
end
