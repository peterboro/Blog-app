class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post)

    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: ':( Cannot Add A Like retry again :('
    end
  end
end
