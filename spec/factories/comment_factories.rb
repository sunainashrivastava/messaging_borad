# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'comment body' }
    user
    post
  end
end
