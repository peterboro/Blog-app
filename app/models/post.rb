class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                               allow_nil: true
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                            allow_nil: true

  after_save :updates_post_counter_user

  def updates_post_counter_user
    author.update(posts_counter: author.posts.count)
  end

  def most_recent_comments
    Comment.includes(:author).where(post_id: id).order(created_at: :desc).limit(3)
  end
end
