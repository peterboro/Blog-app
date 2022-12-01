class User < ApplicationRecord
  has many :posts, foreign_key: 'author_id'
  has many :likes, foreign_key: 'author_id'
  has many :comments, foreign_key: 'author_id'

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
