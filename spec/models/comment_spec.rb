require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Casper',
      photo: 'https://Casper.com/Casper.jpg',
      bio: 'This Casper bio',
      posts_counter: 0
    )
    @post = Post.create(
      title: 'A new Post',
      text: 'Web Developer',
      author_id: @user.id,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it '@users comments_counter should increase by one' do
    Comment.create(text: 'Hello World!', author_id: @user.id, post_id: @post.id)
    Comment.create(text: 'Welcome World!!', author_id: @user.id, post_id: @post.id)
    post = Post.find(@post.id)
    expect(post.comments_counter).to eq(2)
  end
end