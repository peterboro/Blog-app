require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before :each do
    @pic = 'https://picsum.photos/200'
    @author = User.create(name: 'Hero',
                          photo: @pic,
                          bio: 'This is a bio')
    @first_post = Post.create(author: @author, title: 'This title', text: 'My first post')
    @second_post = Post.create(author: @author, title: 'Second Title', text: 'My second post')
    @comment1 = Comment.create(author: @author, post: @second_post, text: 'Thank you')
    @comment2= Comment.create(author: @author, post: @second_post, text: 'Thank you')
    @comment3 = Comment.create(author: @author, post: @second_post, text: 'Thank you')

    visit user_posts_path(@author)
  end

  it 'shows the username of the user' do
    expect(page).to have_content('Hero')
  end
  
  it 'shows the user photo' do
    expect(page).to have_css('div.user-avatar')
  end

  it 'shows number of comments a post has' do
    expect(page.body).to include('Comments: 3')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 0')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@second_post.title)
  end

  it 'shows part of a post body (My second post)' do
    expect(page).to have_content(@second_post.text)
  end

  it 'shows the comments on a post like (Thank you)' do
    expect(page).to have_content('Thank you')
    expect(page).to have_content('Thank you')
    expect(page).to have_content('Thank you')
  end

  it 'to show the Pagination buttons' do
    expect(find_link('Pagination')).to be_visible
  end

  it 'Redirect to post show page when a post is clicked' do
    click_link @first_post.title
    expect(current_path).to match user_post_path(@author, @first_post)
  end
end