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

  def self.last_four
    notations = []
    movies = []

    User.where(rank: 0).each {|user|notations << Notation.where(user: user)}
    notations = notations.flatten.sort_by {|obj| obj.updated_at}
    notations.each {|notation| movies << notation.movie}
    movies.uniq!

    if movies.size >= 4
			return movies.drop(movies.size - 4)
		else
			return movies 
		end
  end

  def self.extreme_notations
		return Notation.all.select{|element| element.average > 80 || element.average < 25}
	end

  def average
    return (self.scenario + self.image + self.editing + self.sound + self.makeup + self.directing) / 6
  end

end
