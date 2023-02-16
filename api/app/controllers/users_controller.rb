# frozen_string_literal: true

class UsersController < ApplicationController
  def upload_avatar
    user = User.find post_avatar_params[0]
    user.avatar.attach(post_avatar_params[1])
    render_success
  end

  private

  def post_avatar_params
    params.require(%i[user_id avatar])
  end
end
