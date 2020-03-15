# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:post1) { create(:post, user_id: user.id) }

  let(:valid_attributes) do
    { body: 'comment title', user_id: user.id }
  end

  let(:invalid_attributes) do
    { name: 'title', test: 'body' }
  end

  let(:valid_session) { {} }

  before do
    sign_in(user)
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Comment' do
        expect do
          post :create, params: { comment: valid_attributes, post_id: post1.id }
        end.to change(Comment, :count).by(1)
      end
    end
  end
end
