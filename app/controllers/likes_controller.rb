class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.includes(:comments, :likes).find(params[:post_id])
    @user = current_user
    @like = Like.new(author_id: @user.id, post_id: @post.id)

    respond_to do |format|
      if @like.save
        format.html do
          redirect_to user_post_path(user_id: @post.author_id, id: @post.id), notice: "Your liked #{@post}"
        end
      else
        flash.now[:alert] = @like.errors.full_messages.to_sentence
        format.html { redirect_to @post }
      end
    end
  end
end
