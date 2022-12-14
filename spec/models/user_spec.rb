require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(
      name: 'Waleed',
      photo: 'http://Waleed.png',
      bio: 'Web Developer',
      posts_counter: 0
    )
  end

  it '@user as created is valid' do
    expect(@user).to be_valid
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'posts_counter should be >= 0' do
    @user.posts_counter = -4
    expect(@user).to_not be_valid
  end

  it 'posts_counter should be numeric' do
    @user.posts_counter = 'One'
    expect(@user).to_not be_valid
  end

  it 'should return a users last 3 posts' do
    user = User.create(
      name: 'Waleed',
      bio: 'Web Developer',
      photo: 'http://Waleed.png',
      posts_counter: 0
    )
    10.times.collect do
      Post.create(
        title: 'Waleed2',
        text: 'Hello World!',
        author_id: user.id,
        likes_counter: 0,
        comments_counter: 0
      )
    end
    expect(user.fetch_recent_posts.length).to eq(3)
  end
end
