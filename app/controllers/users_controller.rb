class UsersController < ApplicationController
  def index
    if current_user.host
      @users_draft = []
      @trips = Trip.where(user_id: current_user.id)
      @trips.each do |trip|
        trip.users.each do |user|
          @users_draft << user
        end
      end
      @users = @users_draft.uniq
    end
  end
end
