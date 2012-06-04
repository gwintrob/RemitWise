class InvitationsController < ApplicationController
  def accept
    invitation = Invitation.find(params[:id])
    invitation.accept

    respond_to do |format|
      format.html do
        flash[:notice] = "Invitation from #{invitation.user.email} accepted."
        redirect_to root_path
      end
    end
  end

  def destroy
    invitation = Invitation.find(params[:id])
    invitation.destroy

    respond_to do |format|
      format.html do
        flash[:notice] = "Invitation ignored."
        redirect_to root_path
      end
      format.json { head :ok }
    end

  end

end
