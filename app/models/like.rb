class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def updates_like_counters_in_post
    post.increment!(:likes_counter)
  end
end
