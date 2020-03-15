# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:post).class_name('Post') }
  end

  context 'scope' do
    it 'applies a desc scope to collections by created_at descending order' do
      comment1 = create(:comment)
      comment2 = create(:comment)
      expect(Comment.all.desc).to eq Comment.all.order('comments.created_at DESC')
    end
  end
end
