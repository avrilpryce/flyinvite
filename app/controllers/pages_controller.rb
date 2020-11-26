class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in? && current_user.host
      @owned_trips = current_user.owned_trips
    end
    if user_signed_in?
      @trips = current_user.trips
      @all_trips = Trip.all
    end
  end
end
