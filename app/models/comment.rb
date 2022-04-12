class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :comments, foreign_key: :parent_id
  has_many :likes, as: :likeable

  validates :user_id, :content, :post_id, uniqueness: true
end
