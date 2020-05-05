class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
    render 'dojos/index'
  end

  def new
    if flash[:errors]
      @errors = flash[:errors]
    end
    render 'dojos/new'
  end

  def create
    dojo = Dojo.new(params_filtered)
    if dojo.valid?
      dojo.save
      redirect_to '/'
    else
      flash[:errors] = dojo.errors.full_messages
      redirect_to '/dojos/new'
    end
  end

  def show
    dojo = Dojo.where(id: params[:id])
    unless dojo.empty?
      @dojo = dojo[0]
      @students = @dojo.students.all
      render "/dojos/show"
    else
      redirect_to '/'
    end
  end

  def edit
    puts request.referer
    dojo = Dojo.where(id: params[:id])
    unless dojo.empty?
      @dojo = dojo[0]
      if flash[:errors]
        @errors = flash[:errors]
      end
      render "/dojos/edit"
    else
      redirect_to "/"
    end
  end

  def update
    dojo = Dojo.find(params[:id])
    x = params_filtered.reject! {|k,v| v.blank?}
    unless x.empty?
      unless dojo.update(x)
      flash[:errors] = dojo.errors.full_messages 
      end
    else
      flash[:errors] = ["All fields cannot be blank"]
    end
    redirect_to "#{request.referer}"
  end

  def destroy
    if ["http://localhost:3000/", "http://localhost:3000/dojos"].include? request.referer
      dojo = Dojo.where(id: params[:id])
      unless dojo.empty?
        dojo = dojo[0]
        dojo.destroy
      end
    end
    redirect_to '/'
  end

  private
  def params_filtered
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
end
