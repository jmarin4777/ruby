class LikesController < ApplicationController
  def create
    user = current_user
    secret = Secret.where(id: params[:secret])
    unless secret.empty?
      secret = secret[0]
      like = Like.new(user: user, secret: secret)
      unless like.save
        flash[:errors] = like.errors.full_messages
      end
    end
    redirect_to "/secrets"
  end

  def destroy
    user = current_user
    secret = Secret.where(id: params[:secret])
    unless secret.empty?
      secret = secret[0]
      like = Like.where(user:user, secret: secret)
      unless like.empty?
        like = like[0]
        user.likes.delete(like)
      end
    end
    redirect_to "/secrets"
  end
end
