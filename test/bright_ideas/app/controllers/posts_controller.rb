class PostsController < ApplicationController
  def create
    user = current_user
    post = Post.new(params_filtered.merge(user: user))
    if post.valid?
      post.save
    else
      flash[:errors] = post.errors.full_messages
    end
    redirect_to "/bright_ideas"
  end

  def show
    @post = Post.where(id: params[:id])
    unless @post.empty?
      @post = @post[0]
      render 'posts/show'
    else
      redirect_to "/bright_ideas"
    end
  end

  def destroy
    user = current_user
    post = Post.where(id: params[:post])
    unless post.empty?
      post = post[0]
      if post.user == current_user
        post.destroy
      end
      redirect_to "/bright_ideas"
    end
  end

  private
  def params_filtered
    params.require(:post).permit(:content)
  end
end