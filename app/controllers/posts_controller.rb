class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource

  def index
    # @author = User.find_by(id: params[:user_id])
    @users = User.find_by(id: params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: params[:id])
    @comment = Comment.new
    @users = User.find_by(id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @author = User.find_by(id: params[:user_id])
    @post = @author.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: 'Post not saved'
    end
  end

  def destroy
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
    @users.decrement!(:posts_counter)
    @post.destroy
    redirect_to user_posts_path, notice: 'Deleted Post'
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
