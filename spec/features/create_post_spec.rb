# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create New Post' do
  scenario 'with title and description' do
    user = create(:user)
    login_as(user)
    visit new_post_path
    fill_in 'Post Title', with: 'test post title'
    fill_in 'Post Description', with: 'test post description'
    click_button 'save'

    expect(page).to have_content('Post was successfully created.')
  end
end
