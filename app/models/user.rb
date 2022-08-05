class User < ApplicationRecord

  has_many :rooms
  has_many :reservations

  has_one_attached :user_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, length: {maximum: 50}

end