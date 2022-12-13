require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @pic = 'https://picsum.photos/200'
    @author = User.create(name: 'Hero',
                          photo: @pic,
                          bio: 'This is a bio')
    @post = Post.create(author: @author, title: 'This Title',
                        text: 'This is my first post')

    @comment1 = Comment.create(author: @author, post: @post, text: 'Thank you')
    @comment2 = Comment.create(author: @author, post: @post, text: 'Second comment')
    @comment3 = Comment.create(author: @author, post: @post, text: 'Third comment')

    @like1 = @post.likes.create!(author: @author)

    visit user_post_path(@author, @post)
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@author.name)
  end

  it 'shows number of comments the post has' do
    expect(page.body).to include('Comments: 3')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 1')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows part of a post body (This is my first post)' do
    expect(page).to have_content(@post.text)
  end

  it 'shows the comments on the post users left like(Thank you)' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment3.text)
  end

  it 'shows the user name of a comment' do
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment2.author.name)
    expect(page).to have_content(@comment3.author.name)
  end

  it 'not to show the Pagination buttons' do
    expect(page).not_to have_link('Pagination')
  end
end
