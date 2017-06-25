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
    p "im here"
    p params[:poll_id]
    if appt.save
      response = Response.new(
                              appt_id: appt.id,
                              user_id: current_user.id,
                              )
      if response.save

      else
        p "QQQQQQQQQQQ"
        p response.errors
      end
    else
      p "vgvghvhgvhgvghvhg"
      p appt.errors
      flash[:success] = "Meeting saved."
      redirect_to "/polls/#{appt.poll_id}"
    end
  end
end
