class LikesController < ApplicationController
  def create
    user = current_user
    post = Post.where(id: params[:post])
    unless post.empty?
      post = post[0]
      like = Like.new(user: user, post: post)
      unless like.save
        flash[:errors] = like.errors.full_messages
      end
    end
    redirect_to "/bright_ideas"
  end
end
