class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.includes(:author, :comments, :likes).find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(user_id: @post.author_id, id: @post.id), notice: 'Comment created successfully!'
        end
      else
        flash.now[:alert] = @comment.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  private

 
  # def destroy
  #   @post = Post.includes(:comments).find(params[:id])
  #   @post.author = current_user
  #   if @post.present?
  #   @post.destroy
  #   end
    
  #   # Redirect
  #   respond_to do |format|
  #     format.html { redirect_to user_path(id: @post.author_id), notice: 'Post was removed.' }
  #   end
  # end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
