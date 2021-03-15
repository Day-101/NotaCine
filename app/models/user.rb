class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :rank, presence: true

  has_many :notations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
