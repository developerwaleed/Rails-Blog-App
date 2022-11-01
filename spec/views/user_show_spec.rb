require 'rails_helper'

RSpec.describe 'User', type: :feature do
      user = User.first

    before(:each) do
        visit(user_path(User.first.id))
    end

    it "has users's profile picture." do
        expect(page.html).to include('img-thumbnail')
    end

    it "has users's username." do
        expect(page).to have_content(user.name)
    end

    it "has users's bio." do
        expect(page).to have_content(user.bio)
    end

    it 'has users number of posts' do
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end

    it 'has link to all posts' do
        expect(page).to have_link('See all posts')
    end

    it 'has recent three posts' do
        expect(page).to have_selector('.post-card', count: 1)
    end

    it 'redirects to user post show page' do
        post = user.posts.first
        click_link(post.title)
        expect(page.current_path).to eql(user_post_path(user_id: user.id, id: post.id))
    end

    it 'redirects to all user posts page' do
        click_link('See all posts')
        expect(page.current_path).to eql(user_posts_path(user_id: user.id).to_s)
    end
end