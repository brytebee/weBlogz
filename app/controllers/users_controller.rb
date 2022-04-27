class UsersController < ApplicationController
  def index; end

  def users; end

  def show; end

  def new
  end

  def create
    @user = user.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end
end
