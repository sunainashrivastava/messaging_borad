# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body
  scope :desc, -> { order('posts.created_at DESC') }
end
