class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def update_post_counter
    post.increment!(:posts_counter)
  end
end
