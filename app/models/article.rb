class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :category, foreign_key: 'category_id'
  belongs_to :user, foreign_key: 'author_id'
  has_many :votes, dependent: :destroy
  has_many :comments, foreign_key: 'article_id', dependent: :destroy
  has_one_attached :image, dependent: :destroy
end
