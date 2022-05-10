class Post < ApplicationRecord
  after_save :increment_posts_counter

  belongs_to :author, class_name: 'User', dependent: destroy
  has_many :likes, dependent: destroy_all
  has_many :comments, dependent: destroy_all

  validates :title, presence: true
  validates_associated :author
  validates_presence_of :author_id
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :text, length: { in: 10..500 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end
end
