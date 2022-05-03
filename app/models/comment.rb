class Comment < ApplicationRecord
  after_save :update_comment_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  private

  def update_comment_counter
    post.increment!(:posts_counter)
  end
end
