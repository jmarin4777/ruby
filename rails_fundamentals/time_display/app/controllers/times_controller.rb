
class TimesController < ApplicationController
  def main
    date_time = Time.now
    @date = date_time.strftime("%B #{date_time.day.ordinalize}, %Y")
    @time = date_time.in_time_zone("Central Time (US & Canada)").strftime("%I:%M %p")
    render 'main'
  end
end
