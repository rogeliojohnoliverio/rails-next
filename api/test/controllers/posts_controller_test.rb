# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get posts_url, as: :json, headers: token_headers
    assert_response :success
  end

  test 'should create post' do
    post_create_params = { title: 'Sample', content: 'Sample', user_id: 1 }
    post posts_url, params: post_create_params, as: :json, headers: token_headers

    assert_response :created
  end

  test 'should show post' do
    get post_url(1), as: :json, headers: token_headers
    assert_response :success
  end

  test 'should update post' do
    post_update_params = { title: 'Sample update', content: 'Sample update', user_id: 1 }
    patch post_url(1), params: post_update_params, as: :json, headers: token_headers
    assert_response :success
  end

  test 'should destroy post' do
    delete post_url(1), as: :json, headers: token_headers

    assert_response :no_content
  end
end
