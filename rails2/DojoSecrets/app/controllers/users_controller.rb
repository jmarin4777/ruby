class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  before_action :check_user, only: [:show, :edit, :update, :destroy]
  def new
  end

  def show
    @user = current_user
    render 'users/show'
  end

  def create
    user = User.new(name: params[:Name], email: params[:Email], password: params[:Password], password_confirmation: params[:Password_Confirmation])
    if user.valid?
      user.save
      redirect_to "/sessions/new"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def edit
    @user = current_user
    render 'users/edit'
  end

  def update
    user = current_user
    unless user.update(name: params[:name], email: params[:email])
      flash[:errors] = user.errors.full_messages
    end
    redirect_to "/users/#{user.id}/edit"
  end

  def destroy
    user = current_user
    user.destroy
    session.delete(:user_id)
    redirect_to '/users/new'
  end

  private 
  def check_user
    if session[:user_id]
      if session[:user_id] != params[:id].to_i
        redirect_to action: "show", id: session[:user_id]
      end
    end
  end
end
