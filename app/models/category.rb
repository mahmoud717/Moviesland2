class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :articles, foreign_key: 'category_id'
end
