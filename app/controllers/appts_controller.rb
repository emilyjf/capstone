class ApptsController < ApplicationController
  before_action :authenticate_user!

  def new
    @appt = Appt.new
  end

  def create
    appt = Appt.new(
                    scheduled_slot: params[:scheduled_slot],
                    scheduled_slot2: params[:scheduled_slot2],
                    scheduled_slot3: params[:scheduled_slot3],
                    scheduled_slot4: params[:scheduled_slot4],
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
      flash[:success] = "Your meeting is scheduled. We're sending emails to your invitees now."
      redirect_to "/polls/#{appt.poll_id}"
    end
  end

  def show
    @appt = Appt.find(params[:id])
  end

  def edit
    @appt = Appt.find(params[:id])
  end

  def update
     appt = Appt.update(
                    scheduled_slot: params[:scheduled_slot],
                    scheduled_slot2: params[:scheduled_slot2],
                    scheduled_slot3: params[:scheduled_slot3],
                    scheduled_slot4: params[:scheduled_slot4],
                    poll_id: params[:poll_id]
                    )
    p params[:poll_id]
    appt.save
  end

  # def destroy
  #   appt = Appt.find(params[:id])
  #   appt.destroy
  #   flash[:warning] = Appointment deleted.
end
