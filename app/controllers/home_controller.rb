class HomeController < ApplicationController

  def index

    if current_user
      @invitations = current_user.incoming_invitations 
      render :user_home
    else
      render :logged_out
    end

  end

end
