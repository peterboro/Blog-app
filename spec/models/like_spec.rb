require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @author = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 1)
    @post = Post.create(title: 'My first post', text: 'This is my first post.', comments_counter: 0, likes_counter: 0,
                        author_id: @author.id)
    @like = Like.create(author_id: @author.id, post_id: @post.id)
  end

  it 'is valid with valid attributes' do
    expect(@like).to be_valid
  end

  it 'is not valid without a author' do
    @like.author = nil
    expect(@like).to_not be_valid
  end

  it 'is not valid without a post' do
    @like.post = nil
    expect(@like).to_not be_valid
  end
end
