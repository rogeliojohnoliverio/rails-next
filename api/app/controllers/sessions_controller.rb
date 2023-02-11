# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :auth, :require_auth

  # GET /sessions
  def index
    auth
    render json: @current_session, include: :user
  end

  def create
    user = User.find_by(email: params[:email])
    return render_auth_error unless user.authenticate(params[:password])

    session = Session.generate!(user)
    render json: session, include: [{ user: { except: :password_digest } }]
  end

  def destroy
    auth
    session = Session.find_by(token: @current_session.token)
    session.destroy!
    render_success
  end
end
