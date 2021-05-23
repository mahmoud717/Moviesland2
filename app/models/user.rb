class User < ApplicationRecord
  include ImageUploader::Attachment(:image)
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :articles, foreign_key: 'author_id', dependent: :destroy
  has_many :votes, foreign_key: 'user_id', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  
end
