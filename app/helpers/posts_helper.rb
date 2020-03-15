# frozen_string_literal: true

module PostsHelper
  def edit_action?(action)
    action.eql?('edit')
  end

  def author_name(user)
    user.name.capitalize
  end
end
