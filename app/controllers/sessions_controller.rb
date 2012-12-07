class SessionsController < ApplicationController
  def new
    redirect_to '/auth/github'
  end

  def create
    @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_url
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
