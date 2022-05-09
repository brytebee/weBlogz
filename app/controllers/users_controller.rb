class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts, :comments, :likes).find(params[:id])
  end
end
