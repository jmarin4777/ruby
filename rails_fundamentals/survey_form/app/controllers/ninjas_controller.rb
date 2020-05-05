class NinjasController < ApplicationController
  def index

  end

  def result
    if session[:ninja]
      @ninja = session[:ninja]
      @times = Ninja.count
      render 'result'
    else
      redirect_to ''
    end
  end

  def create
    ninja = Ninja.new(params_filtered)
    puts ninja.inspect
    puts ninja.valid?
    if ninja.valid?
      ninja.save
      session[:ninja] = ninja
    else
      flash[:errors] = ninja.errors.full_messages
    end
    redirect_to '/result'
  end

  private
  def params_filtered
    params.require(:ninja).permit(:name, :dojo, :lang, :comment)
  end
end
