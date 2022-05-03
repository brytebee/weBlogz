class Post < ApplicationRecord
  after_save :increment_posts_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def recent_comment
    comments.where(author_id.params[:id]).order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end
end
