class SessionsController < ApplicationController

  def new
  end

  def create
    u = User.find_by_username(params[:username])
    if u.present? && params[:password] == u.password
      session[:user_id] = u.id
      redirect_to movies_url, notice: "signed in succesfully"
    else
      redirect_to new_session_url, notice: "nice try"
    end
  end

  def destroy
    reset_session
    redirect_to new_session_url, notice: "signed out"
  end

end
