# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:posts).class_name('Post') }
    it { should have_many(:comments).class_name('Comment') }
  end
end
