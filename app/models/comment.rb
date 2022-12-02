class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def updates_comments_counter_post
    post.update(comments_counter: post.comments.count)
  end
end
