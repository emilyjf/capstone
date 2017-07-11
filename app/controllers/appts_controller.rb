class ApptsController < ApplicationController
  before_action :authenticate_user!

  def new
    @poll = Poll.find(params[:poll_id])
    @appt = Appt.new
  end

  def create
    appt = Appt.new(
                    scheduled_slot: params[:scheduled_slot],
                    poll_id: params[:poll_id]
                    )
    p params[:poll_id]
    if appt.save
    # Tell the UserMailer to send an email about the poll after save
    UserMailer.poll_email(user).deliver_now
      response = Response.new(
                              appt_id: appt.id,
                              user_id: current_user.id,
                              )
      if response.save

      else
        p "Our apologies. Something is awry."
        p response.errors
      end
    else
      p "Oops. We're sorry; something has gone terribly wrong."
      p appt.errors
      flash[:success] = "Meeting times saved. Emails are being sent to your invitees."
      redirect_to "/polls/#{appt.poll_id}"
    end
  end
end
