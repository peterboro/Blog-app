require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @author = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 1)
    @post = Post.create(title: 'My first post', text: 'This is my first post.', comments_counter: 0, likes_counter: 0,
                        author_id: @author.id)
  end

  it 'is valid with valid attributes' do
    expect(@post).to be_valid
  end

  it 'is not valid without a title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'is not valid without author valid attributes' do
    @post.author_id = nil
    expect(@post).to_not be_valid
  end

  it 'is not valid without a text' do
    @post.text = 'This is my first post'
    expect(@post).to be_valid
  end

  it 'is not valid without a comments_counter' do
    @post.comments_counter = nil
    expect(@post).to_not be_valid
  end

  it 'is not valid without a likes_counter' do
    @post.likes_counter = nil
    expect(@post).to_not be_valid
  end
end
