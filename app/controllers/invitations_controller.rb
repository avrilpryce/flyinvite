class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.where(email: current_user.email)
  end

  def show
  end

  def new
  end
  
  def create
    @trip = Trip.find(params[:trip_id])
    @invitation = Invitation.new(invitation_params)
    @invitation.trip_id = @trip.id
    @invitation.save
    
    send_invitation

    redirect_to trip_path(@trip)
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(invitation_params)
    @trip = @invitation.trip
    if @invitation.status == "Accepted"
      @trip.users << current_user
    end
    
    redirect_to trip_path(@trip)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :status)
  end

  def send_invitation
    InviteMailer.with(invitation: @invitation).invite.deliver_now
  end
end
