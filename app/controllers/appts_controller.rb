class ApptsController < ApplicationController
  before_action :authenticate_user!

  def new
    @appt = Appt.new
  end

  def create
    appt = Appt.new(
                    scheduled_slot: params[:scheduled_slot],
                    poll_id: params[:poll_id]
                    )
    if appt.save
      current_user.appt << @appt
      flash[:success] = "Meeting saved."
      redirect_to polls_url(id: user.id)
    else
      redirect_to "/polls"
    end
  end
end
