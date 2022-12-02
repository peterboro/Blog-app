require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'test cases for comments' do
    before(:each) do
      @author = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.', posts_counter: 1)
      @post = Post.create(title: 'My first post', text: 'This is my first post.', comments_counter: 0,
                          likes_counter: 0, author_id: @author.id)
      @comment = Comment.create(text: 'This is my first comment.', author_id: @author.id, post_id: @post.id)
    end

    it 'is valid with valid attributes' do
      expect(@comment).to be_valid
    end

    it 'is not valid without a text' do
      @comment.text = 'This is my first comment'
      expect(@comment).to be_valid
    end

    it 'is not valid without a author' do
      @comment.author = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid without a post' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end
  end
end
