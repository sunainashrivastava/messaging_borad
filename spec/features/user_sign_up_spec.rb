# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password', 'valid'

    expect(page).to have_content('You have signed up successfully')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password', 'valid'

    expect(page).to have_content('error prohibited this user from being saved')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', '', ''

    expect(page).to have_content('error prohibited this user from being saved')
  end

  def sign_up_with(email, password, name)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Re-enter Password', with: password
    fill_in 'Name', with: name
    click_button 'Sign up'
  end
end
