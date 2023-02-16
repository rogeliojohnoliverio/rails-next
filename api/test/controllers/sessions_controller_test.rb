# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  session_create_params = {
    email: 'rogelio@gmail.com',
    password: 'password'
  }

  test 'should get index' do
    get sessions_url, as: :json, headers: token_headers
    assert_response :success
  end

  test 'should create session' do
    users(:one).update!(password: session_create_params[:password])
    post sessions_url, params: session_create_params, as: :json

    assert_response :ok
  end

  test 'email should not be found' do
    users(:one).update!(password: session_create_params[:password])
    assert_raise(NoMethodError) do
      post sessions_url, params: { email: 'test@example.com', password: session_create_params[:password] }, as: :json
    end
  end

  test 'invalid password' do
    users(:one).update!(password: session_create_params[:password])
    post sessions_url, params: { email: session_create_params[:email], password: 'invalid' }, as: :json

    assert_response :unauthorized
  end

  test 'should destroy session' do
    delete session_url(1), as: :json, headers: token_headers
    assert_response :ok
  end
end
