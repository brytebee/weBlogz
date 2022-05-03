class Like < ApplicationRecord
  after_save :update_post_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def update_post_counter
    post.increment!(:likes_counter)
  end
end
