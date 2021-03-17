class User < ApplicationRecord
  after_create :default_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :rank, presence: true
  validates :username,length:{in:3..16}, presence: true

  has_many :notations, dependent: :destroy
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def default_avatar
    self.avatar.attach(io: File.open(ActionController::Base.helpers.image_path("avatar-default.png")),filename:"default_profile_picture")
  end


end
