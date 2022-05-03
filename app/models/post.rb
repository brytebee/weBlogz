class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def increment_posts_counter
    author.increment!(:posts_counter)
  end
end
