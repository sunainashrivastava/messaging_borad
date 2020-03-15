# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:comments).class_name('Comment') }
  end

  context 'scope' do
    it 'applies a desc scope to collections by created_at descending order' do
      post1 = create(:post)
      post2 = create(:post)
      expect(Post.all.desc).to eq Post.all.order('posts.created_at DESC')
    end
  end
end
