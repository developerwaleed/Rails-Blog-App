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
    get '/users/1/posts'
    expect(response.status).to eq(200)
    expect(response).to render_template('index')
  end

  it 'renders the correct single post page' do
    get '/users/1/posts/1'
    expect(response.status).to eq(200)
    expect(response).to render_template('show')
  end

  it 'renders index template with right text' do
    visit '/users/1/posts/'
    expect(page).to have_text('posts')
  end

  it 'renders show template with right text' do
    visit '/users/1/posts/1'
    expect(page).to have_text('Post View')
  end
end
