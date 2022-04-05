class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_one_attached :avatar
  has_many :likes, as: :likeable

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant resize_to_limit: [50, 50]
    else
      "/default_profile.png"
    end
  end
end


