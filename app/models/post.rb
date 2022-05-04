class Post < ApplicationRecord
  after_save :increment_posts_counter

  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end
end
