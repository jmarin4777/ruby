class UsersController < ApplicationController
  def index
    @users = User.all
    render layout: "two_column"
  end
end
