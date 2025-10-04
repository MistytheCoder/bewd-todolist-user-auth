class ApplicationController < ActionController::Base
  # Make current_user accessible in views and controllers
  helper_method :current_user

  private

  def current_user
    # Look for a token in the Authorization header
    token = request.headers['Authorization']
    return nil unless token

    session = Session.find_by(token: token)
    session&.user
  end
end
