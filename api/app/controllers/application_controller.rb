# frozen_string_literal: true

class ApplicationController < ActionController::API
  include CommonResponse
  before_action :auth, :require_auth
  def auth
    return @current_session = nil unless request.authorization

    token = request.authorization.split[1]
    @current_session = Session.find_by(token:)
  end

  def require_auth
    return render_forbidden unless @current_session
  end
end
