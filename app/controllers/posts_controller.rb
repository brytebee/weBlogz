class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.includes(:posts, :comments, :likes).find(params[:user_id])
    @posts = Post.all
  end

  def show
    @post = Post.includes(:author, :comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.author_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_path(id: @post.author_id), notice: 'Post created successfully!' }
      else
        flash.now[:alert] = @post.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = User.find(@post.author_id)
    user.posts_counter -= 1
    @post.destroy if @post.present?
    user.save

    # Redirect
    respond_to do |format|
      format.html { redirect_to user_path(id: @post.author_id), notice: 'Post was removed.' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
