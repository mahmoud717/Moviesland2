class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200,
                                                too_long: '200 characters in comment is the maximum allowed.' }
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :article, class_name: 'Article', foreign_key: 'article_id'
end
