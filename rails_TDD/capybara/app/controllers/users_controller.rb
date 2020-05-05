class UsersController < ApplicationController
  def new
  end
  def show
    @user = User.where(id=params[:id])
    unless @user.empty?
      @user = @user[0]
      render 'users/show'
    else
      redirect_to 'users/new'
    end
  end
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      # flash[:notice] = ['User successfully created']
      redirect_to user_path(@user.id)
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
end
