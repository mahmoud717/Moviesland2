class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :votes, foreign_key: 'user_id', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_one_attached :profile_image, dependent: :destroy
end
