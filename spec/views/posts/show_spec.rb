require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @user = User.create(name: 'User1', photo: 'https://picsum.photos/200', bio: 'This is a bio' )
    @post = Post.create(title: 'Post1', text: 'This is a post', author_id: @user.id)
  end

  it 'displays the title of the post' do
    visit post_path(@post)
    expect(page).to have_content(@post.title)
  end

  it 'displays the author of the post' do
    visit post_path(@post)
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of likes for the post' do
    visit post_path(@post)
    expect(page).to have_content(@post.likes_counter)
  end

  it 'displays the number of comments for the post' do
    visit post_path(@post)
    expect(page).to have_content(@post.comments_counter)
  end
end