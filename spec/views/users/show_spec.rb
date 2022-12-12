require 'rails_helper'
require 'spec_helper'

RSpec.describe 'User Show', type: :feature do
  before :each do
    @user = User.create(name: 'User1', photo: 'https://picsum.photos/200', bio: 'This is a bio' )
    @post = Post.create(title: 'Post1', text: 'This is a post', author_id: @user.id)
    @comment = Comment.create(text: 'This is a comment', author_id: @user.id, post_id: @post.id)
  end

  it 'displays the user name' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'displays the user photo' do
    visit user_path(@user)
    expect(page).to have_css("img[
      src='https://picsum.photos/200']")
  end

  it 'displays the user bio' do
    visit user_path(@user)
    expect(page).to have_content(@user.bio)
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

  it 'displays the posts for the user' do
    visit user_path(@user)
    expect(page).to have_content(@post.title)
  end

  it 'displays the number of likes for each post' do
    visit user_path(@user)
    expect(page).to have_content(@post.likes_counter)
  end

  it 'displays the number of comments for each post' do
    visit user_path(@user)
    expect(page).to have_content(@post.comments_counter)
  end

  it 'displays the comments for each post' do
    visit user_path(@user)
    expect(page).to have_content(@comment.text)
  end
end