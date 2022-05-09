class Comment < ApplicationRecord
  after_save :update_comment_counter

  validates :text, length: { minimum: 10 }

  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
