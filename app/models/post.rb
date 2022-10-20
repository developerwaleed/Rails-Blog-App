class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'
  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def fetch_recent_comments
    comments.last(5)
  end
end
