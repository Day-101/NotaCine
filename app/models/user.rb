class User < ApplicationRecord
  after_create :default_avatar 
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :rank, presence: true
  validates :username,length:{in:3..16}, presence: true

  has_many :notations, dependent: :destroy
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def default_avatar
    file = URI.open("https://notacine-dvpt.herokuapp.com" + ActionController::Base.helpers.image_path("avatar-default.png").to_s)
    self.avatar.attach(io: file,filename:"default_profile_picture")
  end
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
