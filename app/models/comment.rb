class Comment < ApplicationRecord
  after_create :updates_comments_counter_post

  belongs_to :author, class_name: 'User'
  belongs_to :post

  # A method that updates the comments counter for a post.
  def updates_comments_counter_post
    post.update(comments_counter: post.comments.count)
  end
end
