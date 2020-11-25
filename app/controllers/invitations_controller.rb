class InvitationsController < ApplicationController
  def new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @invitation = Invitation.new(invitation_params)
    @invitation.trip_id = @trip.id
    @invitation.save

    redirect_to trip_path(@trip)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :status)
  end
end
