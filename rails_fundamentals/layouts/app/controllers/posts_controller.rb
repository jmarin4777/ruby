class PostsController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
    render layout: "three_column"
  end
end
