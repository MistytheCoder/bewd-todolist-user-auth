class SessionsController < ApplicationController
  # GET /authenticated
  def authenticated
    @user = current_user
    if @user
      render 'authenticated' # renders authenticated.jbuilder
    else
      render json: { error: 'Not logged in' }, status: :unauthorized
    end
  end
end
