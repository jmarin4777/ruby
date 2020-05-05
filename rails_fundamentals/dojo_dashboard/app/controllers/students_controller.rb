class StudentsController < ApplicationController
  def new
    if flash[:errors]
      @errors = flash[:errors]
    end
    dojo = Dojo.where(id: params[:dojo_id])
    unless dojo.empty?
      @dojo=dojo[0]
      @dojos = Dojo.all
      render 'students/new'
    else
      redirect_to "#{request.referer}"
    end
  end

  def create
    dojo_id = params[:student][:dojo]
    if Dojo.where(id: dojo_id).empty?
      flash[:errors] = ["Dojo does not exist"]
      return redirect_to "#{request.referer}"
    end
    student = Student.new(params_filtered.merge(dojo: Dojo.find(dojo_id)))
    if student.valid?
      student.save
      redirect_to "/dojos/#{dojo_id}"
    else
      flash[:errors] = student.errors.full_messages
      redirect_to "/dojos/#{dojo_id}/students/new"
    end
  end

  def edit
    if flash[:errors]
      @errors = flash[:errors]
    end
    dojo = Dojo.where(id: params[:dojo_id])
    student = Student.where(id: params[:id])
    unless dojo.empty? && student.empty?
      @dojo = dojo[0]
      @student = student[0]
      @dojos = Dojo.all
      render 'students/edit'
    else
      redirect_to "#{request.referer}"
    end
  end

  def update
    if params[:student].key?(:dojo)
      dojo_id = params[:student][:dojo]
      if Dojo.where(id: dojo_id).empty?
        flash[:errors] = ["Dojo does not exist"]
        return redirect_to "#{request.referer}"
      end
    else
      flash[:errors] = ["A Dojo must be selected"]
      return redirect_to "#{request.referer}"
    end
    student = Student.find(params[:id])
    x = params_filtered.reject! {|k,v| v.blank?}.merge(dojo: Dojo.find(dojo_id))
    unless student.update(x)
    flash[:errors] = student.errors.full_messages 
    return redirect_to "#{request.referer}"
    end
    redirect_to "/dojos/#{dojo_id}/students/#{student.id}/edit"
  end

  def show
    dojo = Dojo.where(id: params[:dojo_id])
    student = Student.where(id: params[:id])
    unless dojo.empty? && student.empty?
      @dojo = dojo[0]
      @student = student[0]
      @students = @dojo.students.all.reject {|student| student.created_at.to_date != @student.created_at.to_date}
      render "/students/show"
    else
      redirect_to "#{request.referer}"
    end
  end

  def destroy
    links = (Dojo.all).map {|dojo| dojo = "http://localhost:3000/dojos/#{dojo.id}"}
    if links.include? request.referer
      student = Student.where(id: params[:id])
      unless student.empty?
        student = student[0]
        student.destroy
      end
    end
    redirect_to "/dojos/#{params[:dojo_id]}"
  end
  
  private
  def params_filtered
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
