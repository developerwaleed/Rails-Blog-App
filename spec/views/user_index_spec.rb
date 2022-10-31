require 'rails_helper'

RSpec.describe 'Index page', type: :system do
    before(:each) do
      @user = User.create(
        name: 'Waleed',
        bio: 'Software Developer',
        photo: 'http://hello.com/org.png',
        posts_counter: 0
      )
  
      @user_two = User.create(
        name: 'Berkay',
        bio: 'Graphic designer',
        photo: 'http://hello.com/ogene.png',
        posts_counter: 0
      )
    end
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Waleed')
      expect(page).to have_content('Berkay')
    end

    it 'should have the profile picture' do
      visit users_path
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/org.png')]")
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/ogene.png')]")
    end

    it 'should have number of users post' do
      visit users_path
      expect(page).to have_content('Number of posts: 0')
    end

    it 'should redirect to users show page' do
      visit user_path(@user.id)
      expect(page).to have_content('Waleed')
      expect(page).to have_content('Software Developer')
    end
  end
end