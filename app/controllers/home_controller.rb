class HomeController < ApplicationController

  def index

    if current_user
      render :user_home
    else
      render :logged_out
    end

  end

end
