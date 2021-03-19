class Notation < ApplicationRecord
  validates :scenario, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :image, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :editing, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :sound, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :makeup, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :directing, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validate :error_if_already_reviewed, on: :create

  belongs_to :user
  belongs_to :movie

  def error_if_already_reviewed
   errors.add(:user,"Already reviewed") if Notation.find_by(user: self.user, movie: self.movie)

  end

  def criteria_review(criteria)
    case criteria
      when "scenario"
        notation = self.scenario
      when "image"
        notation = self.image
      when "editing"
        notation = self.editing
      when "sound"
        notation = self.sound
      when "makeup"
        notation = self.makeup
      when "directing"
        notation = self.directing
    end
    return notation
  end

end
