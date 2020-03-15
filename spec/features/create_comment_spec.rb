# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'visit show page of post' do
  scenario 'Create New Comment' do
    user = create(:user)
    post = create(:post)
    login_as(user)
    visit post_path(post.id)

    fill_in 'Comment here...', with: 'this is testing comment'
    click_button 'save'

    expect(page).to have_content('this is testing comment - ')
  end
end
