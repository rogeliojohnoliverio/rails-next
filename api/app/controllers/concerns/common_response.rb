# frozen_string_literal: true

module CommonResponse
  extend ActiveSupport::Concern

  def render_success(message = 'success')
    render json: { result: message }, status: :ok
  end

  def render_bad_request(message = 'bad request')
    render json: { result: message }, status: :bad_request
  end

  def render_auth_error(message = 'auth error')
    render json: { result: message }, status: :unauthorized
  end

  def render_forbidden(message = 'forbidden')
    render json: { result: message }, status: :forbidden
  end

  def render_not_found(message = 'not found')
    render json: { result: message }, status: :not_found
  end

  def render_conflict(message = 'conflict')
    render json: { result: message }, status: :conflict
  end
end
