require 'rails_helper'
RSpec.describe 'User show', type: :feature do
  before :each do
    @user = User.create(name: 'User1', photo: 'https://picsum.photos/200', bio: 'This is a bio' )
    @post = Post.create(title: 'Post1', text: 'This is a post', author_id: @user.id)
  end 

  it 'displays the name of the user' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts for the user' do
    visit user_path(@user)
    expect(page).to have_content(@user.posts_counter)
  end

  it 'displays the number of comments for the user' do
    visit user_path(@user)
    expect(page).to have_content(@user.comments_counter)
  end

  it 'displays the number of likes for the user' do
    visit user_path(@user)
    expect(page).to have_content(@user.likes_counter)
  end

  it 'displays the bio of the user' do
    visit user_path(@user)
    expect(page).to have_content(@user.bio)
  end

  it 'displays the photo of the user' do
    visit user_path(@user)
    expect(page).to have_css('img')
  end

  it 'displays the posts of the user' do
    visit user_path(@user)
    expect(page).to have_content(@post.title)
  end

  it 'displays the author of each post' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of likes for each post' do
    visit user_path(@user)
    expect(page).to have_content(@post.likes_counter)
  end

  it 'displays the number of comments for each post' do
    visit user_path(@user)
    expect(page).to have_content(@post.comments_counter)
  end
end