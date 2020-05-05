class RpgController < ApplicationController
  def index
    unless session[:gold]
      session[:gold] = 0
    end
    unless session[:activity]
      session[:activity] = ""
    end
    @gold = session[:gold]
    @activity = session[:activity].html_safe
    render 'index'
  end
  def find
    unless session[:gold]
      session[:gold] = 0
    end
    if params[:gold] == 'farm'
      gold = rand(10..20)
      session[:gold] += gold
      session[:activity].prepend("<p class='green'>You found #{gold} gold at the farm!</p>")
    elsif params[:gold] == 'cave'
      gold = rand(5..10)
      session[:gold] += gold
      session[:activity].prepend("<p class='green'>You found #{gold} gold in the caves!</p>")
    elsif params[:gold] == 'house'
      gold = rand(2..5)
      session[:gold] += gold
      session[:activity].prepend("<p class='green'>You found #{gold} gold at the house!</p>")
    elsif params[:gold] == 'casino'
      if session[:gold] == 0
        session[:activity].prepend("<p class='red'>You don't have any gold to gamble!</p>")
        return redirect_to '/'
      end
      x = rand() > 0.5 ? "won" : "lost"
      gold = rand(0..50)
      if x == "won"
        session[:gold] += gold
        session[:activity].prepend("<p class='green'>You won #{gold} gold at the casino!</p>")
      else
        if gold > session[:gold]
          session[:gold] -= session[:gold]
          session[:activity].prepend("<p class='red'>You lost #{session[:gold]} gold at the casino!</p>")
        else
          session[:gold] -= gold
          session[:activity].prepend("<p class='red'>You lost #{gold} gold at the casino!</p>")
        end
      end
    elsif params[:gold] == 'reset'
      session.clear
    end
    redirect_to '/'
  end
end
