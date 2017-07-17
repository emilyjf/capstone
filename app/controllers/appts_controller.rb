class ApptsController < ApplicationController
  before_action :authenticate_user!

  def new
    @appt = Appt.new
    @poll_id = params[:poll_id]
  end

  def create

    # {"scheduled_slot"=>["2017-07-11"], "time"=>{"started_at"=>"17:00"}}
    scheduled_slot = params[:scheduled_slot].first
    time = params[:time][:started_at]
    poll = Poll.find(params[:poll_id])
    date = DateTime.parse(scheduled_slot + " " + time + " -05:00")


    appt = Appt.new(
                    scheduled_slot: date,
                    poll_id: poll.id,
                    chosen: false
                    )

    if appt.save!
    # Tell the UserMailer to send an email about the poll after save
    # UserMailer.poll_email(user).deliver_now
      redirect_to "/polls/#{poll.id}"
    else
      p "Oops. We're sorry; something has gone terribly wrong."
      p appt.errors
      flash[:success] = "Your meeting is scheduled. We're sending emails to your invitees now."
      redirect_to "/appts/new?poll_id=#{poll.id}"
    end
  end

  def show
    @appt = Appt.find(params[:id])
  end

  def edit
    @appt = Appt.find(params[:id])
    @poll = @appt.poll
  end

  def update
    scheduled_slot = params[:scheduled_slot].first
    time = params[:time][:started_at]
    poll = Poll.find(params[:poll_id])
    date = DateTime.parse(scheduled_slot + " " + time + " -05:00")

    appt = Appt.find(params[:id])
    poll = appt.poll
    appt.update( scheduled_slot: date )

    redirect_to "/polls/#{poll.id}/edit"
  end

  def destroy
    @appt = Appt.find(params[:id])
    @appt.destroy

    redirect_to "/polls/#{@appt.poll.id}/edit"
  end
end
