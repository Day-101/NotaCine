class Notation < ApplicationRecord
  validates :scenario, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :image, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :editing, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :sound, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :makeup, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true
  validates :directing, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, presence: true

  belongs_to :user
  belongs_to :movie
end
