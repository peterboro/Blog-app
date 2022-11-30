class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comment_counters_in_post
    post.increment!(:comments_counter)
  end
end
