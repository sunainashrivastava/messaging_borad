# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'testing title' }
    body { 'testing body' }
    user
  end
end
