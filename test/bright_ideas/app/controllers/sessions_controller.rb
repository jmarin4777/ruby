class SessionsController < ApplicationController
  def create
    user = User.where(email: params[:email])
      unless user.empty?
        user = user[0]
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          return redirect_to "/bright_ideas"
        end
      end
      flash[:errors] = ["Invalid Email/Password Combination"]
      redirect_to "/users/new"
    end

  def destroy
    session.delete(:user_id)
    flash[:errors] = ["Successfully logged out"]
    redirect_to "/users/new"
  end
end