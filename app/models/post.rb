class Post < ApplicationRecord
  after_save :increment_posts_counter

  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true
  validates_associated :author
  validates_presence_of :author_id
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end
end
