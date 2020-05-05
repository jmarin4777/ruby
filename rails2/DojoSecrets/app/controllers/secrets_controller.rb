class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
    render 'secrets/index'
  end

  def create
    user = current_user
    secret = Secret.new(content: params[:content], user: user)
    if secret.valid?
      secret.save
    else
      flash[:errors] = secret.errors.full_messages
    end
    redirect_to "/users/#{user.id}"
  end

  def destroy
    user = current_user
    secret = Secret.where(id: params[:id])
    unless secret.empty?
      secret = secret[0]
      if secret.user == current_user
        secret.destroy
      end
      redirect_to "/users/#{user.id}"
    end
  end
end
