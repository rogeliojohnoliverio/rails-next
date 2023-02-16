# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should be able to upload_avatar' do
    user_upload_avatar_params = {
      user_id: 1,
      avatar: fixture_file_upload('test.png', 'image/png')
    }

    post users_upload_avatar_url, params: user_upload_avatar_params, headers: token_headers
    assert_response :ok
  end
end
