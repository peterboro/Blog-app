require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before :each do
    @user = User.create(name: 'User1', photo: 'https://picsum.photos/200', bio: 'This is a bio' )
    @post = Post.create(title: 'Post1', text: 'This is a post', author_id: @user.id)
  end

  it 'displays all users' do
    visit users_path
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts for each user' do
    visit users_path
    expect(page).to have_content(@user.posts_counter)
  end

  it 'displays the number of comments for each user' do
    visit users_path
    expect(page).to have_content(@user.comments_counter)
  end

  it 'displays the number of likes for each user' do
    visit users_path
    expect(page).to have_content(@user.likes_counter)
  end
end

