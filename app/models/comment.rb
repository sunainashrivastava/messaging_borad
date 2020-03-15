# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :desc, -> { order('comments.created_at DESC') }
end
