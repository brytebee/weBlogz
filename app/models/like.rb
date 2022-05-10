class Like < ApplicationRecord
  after_save :update_likes_counter

  belongs_to :author, class_name: 'User', dependent: destroy
  belongs_to :post, dependent: destroy

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
