require 'rails_helper'

RSpec.describe 'Posts', type: %w[request feature] do
  before :each do
    @user = User.new(
      name: 'Waleed',
      bio: 'Web Developer',
      photo: 'http://waleed.png',
      posts_counter: 0
    )
    @user.save
  end

  it 'renders the correct posts page' do
    get "/users/#{@user.id}/posts"
    expect(response.status).to eq(200)
    expect(response).to render_template('index')
  end

  it 'renders index template with right text' do
    visit "/users/#{@user.id}/posts/"
    expect(page).to have_text('posts')
  end
end
