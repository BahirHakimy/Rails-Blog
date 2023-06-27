require 'rails_helper'

RSpec.describe 'Users List', type: :system do
  describe 'index page' do
    before(:each) do
        User.create(name: 'Tango', photo: 'http://myphoto')
        User.create(name: 'Mango', photo: 'http://bahirsphoto')
    end
    let (:users) {User.all}
    it 'shows the right content' do
        visit users_path
        users.each do |user|
          expect(page).to have_content(user.name)
        end
    end

    it 'shows the correct photo' do
        visit users_path
        users.each do |user|
          expect(page).to have_css("img[src*='#{user.photo}']")
        end
    end
    
    it 'shows posts counter' do
        visit users_path
        users.each do |user|
            expect(page).to have_selector('sub', text: user.posts.count)
        end
    end 
end

  describe 'checks the links' do 
    before(:each) do
        User.create(name: 'Tango', photo: 'http://myphoto')
        User.create(name: 'Mango', photo: 'http://bahirsphoto')
    end
    let (:users) {User.all}
    it 'the user is redirected to the correct url' do
        visit users_path

        click_link 'Tango'
        expect(current_path).to eq("/users/#{users[0].id}")
    end
  end
end


