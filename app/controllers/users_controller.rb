class UsersController < ApplicationController
  def index
    render 'users'
  end

  def show
    # render 'show'
    @users = User.find_by(id: params[:id])
  end
end
