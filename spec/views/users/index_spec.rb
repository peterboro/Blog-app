require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before :each do
    @pic = 'https://picsum.photos/200'
    @author = User.create(name: 'Hero Nakamura',
                          photo: @pic,
                          bio: 'This is a bio')

    visit users_path
  end

  it 'shows user name' do
    expect(page).to have_content(@author.name)
  end

  it 'shows the user photo' do
    image = page.all('img')
    expect(image.size).to eq 0
  end

  it 'redirects to user show page when a user is clicked' do
    click_link @author.name
    expect(current_path).to match user_path(@author)
  end
end
