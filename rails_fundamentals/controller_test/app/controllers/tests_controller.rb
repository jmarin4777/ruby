class TestsController < ApplicationController
  def hello
    render :text => "Hello CodingDojo!"
  end

  def sayhello
    render :text => "Saying Hello!"
  end

  def sayhellojoe
    render :text => "Saying Hello Joe!"
  end

  def sayhellomichael
    redirect_to "/say/hello/joe"
  end

  def index
    render :text => "What do you want me to say?"
  end

  def times
    if session[:times]
      session[:times] += 1
    else
      session[:times] = 1
    end
    @times = session[:times]
    render :text => "You've visited this url #{@times} times"
  end

  def restart
    session.clear
    render :text => "Destroyed the session!"
  end
end
