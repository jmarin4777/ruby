class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  def new
  # render login page
  end
  def create
  user = User.where(email: params[:Email])
    unless user.empty?
      user = user[0]
      if user.authenticate(params[:Password])
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
      else
        flash[:errors] = ["Invalid Combination"]
        redirect_to "/sessions/new"
      end
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/sessions/new"
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:errors] = ["Successfully logged out"]
    redirect_to "/sessions/new"
  end
end