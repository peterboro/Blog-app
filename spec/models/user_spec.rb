require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 1)

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = 'Tom'
    expect(user).to be_valid
  end

  it 'is not valid without a photo' do
    user.photo = 'https://unsplash.com/photos/F_-0BxGuVvo'
    expect(user).to be_valid
  end

  it 'is valid without a bio' do
    user.bio = 'This is a bio'
    expect(user).to be_valid
  end

  it 'is not valid without a post_counter' do
    user.posts_counter = 1
    expect(user).to be_valid
  end

  it 'returns the most recent posts' do
    expect(user.most_recent_posts).to eq([])
  end
end
