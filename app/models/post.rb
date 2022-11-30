class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :update_post_counters_in_user

  def update_post_counters_in_user
    author.update_counters
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
