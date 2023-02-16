# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get upload_avatar' do
    get users_upload_avatar_url
    assert_response :success
  end
end
