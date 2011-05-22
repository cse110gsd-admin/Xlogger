class EventsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @event = @user.events.create(params[:event])
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    @event.destroy
    redirect_to event_path(@user)
  end
end
