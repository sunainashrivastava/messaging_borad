# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { create(:user) }

  let(:valid_attributes) do
    { title: 'title', body: 'body', user_id: user.id }
  end

  let(:invalid_attributes) do
    { name: 'title', test: 'body' }
  end

  let(:valid_session) { {} }

  before do
    sign_in(user)
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Post.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :edit, params: { id: post.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create, params: { post: valid_attributes }, session: valid_session
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post :create, params: { post: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Post.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { post: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested post' do
        post = Post.create! valid_attributes
        put :update, params: { id: post.to_param, post: new_attributes }, session: valid_session
        post.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the post' do
        post = Post.create! valid_attributes
        put :update, params: { id: post.to_param, post: valid_attributes }, session: valid_session
        expect(response).to redirect_to(post)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = Post.create! valid_attributes
      expect do
        delete :destroy, params: { id: post.to_param }, session: valid_session
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      post = Post.create! valid_attributes
      delete :destroy, params: { id: post.to_param }, session: valid_session
      expect(response).to redirect_to(posts_url)
    end
  end
end
