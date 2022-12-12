require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before :each do
    @pic = 'https://picsum.photos/200'
    @author = User.create(name: 'Hero Nakamura',
                          photo: @pic,
                          bio: 'This is a bio')
    @post1 = Post.create(author: @author, title: 'This title', text: 'My first post')
    @post2 = Post.create(author: @author, title: 'This Second title', text: 'My second post')
    @post3 = Post.create(author: @author, title: 'This Third title', text: 'My third post')
    @post4 = Post.create(author: @author, title: 'This Fourth title', text: 'My fourth post')

    visit user_path(@author)
  end

  it 'shows user name' do
    expect(page).to have_content(@author.name)
  end

  it 'shows user biography' do
    expect(page.body).to have_content(@author.bio)
  end

  it 'shows only the users recent 3 posts' do
    expect(page).to have_content(@post4.text)
    expect(page).to have_content(@post3.text)
    expect(page).to have_content(@post2.text)
    expect(page).not_to have_content(@post1.text)
  end

  it ' shows the user photo' do
    expect(page).to have_css('div.user-avatar')
  end

  it 'shows number of posts user has written' do
    expect(page.body).to include('Posts: 4')
  end

  it 'shows the See all posts button' do
    expect(page).to have_content('See all posts')
  end

  it 'shows the New post button' do
    expect(page).to have_content('New Post')
  end

  it 'redirects to post show page when the post is clicked' do
    expect(page).to have_link(@post4.title)
  end

  it 'redirects to post index page when a \'See all posts\' button is clicked' do
    click_link 'See all posts'
    expect(current_path).to match user_posts_path(@author)
  end

  it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@author))
  end
end
