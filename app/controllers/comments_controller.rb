class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]
    load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: 'Comment not saved'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @post.decrement!(:comments_counter)
    @comment.destroy
    redirect_to user_post_path(user_id: @post.author_id, post_id: @post.id), notice: 'Deleted Comment'
  end
  

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
