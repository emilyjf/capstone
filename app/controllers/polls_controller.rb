class PollsController < ApplicationController
  before_action :authenticate_user!

  def index
    @polls = Poll.where(admin_id: current_user.id)
    @response_polls = current_user.polls
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(
                    admin_id: current_user.id,
                    title: params[:title],
                    status: "In progress",
                    address: params[:address],
                    city: params[:city],
                    state: params[:state]
                    )

    @poll.invite(params[:invitees])

    if @poll.save
      #current_user.save
      # we have poll.id here to send to email
      # put in email method here, passing in poll.id
      redirect_to "/appts/new?poll_id=#{@poll.id}"
    else
      flash[:warning] = "Unable to save."
      render 'new.html.erb'
    end
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def user_edit
    @poll = Poll.find(params[:id])
  end

  def update
    poll = Poll.find(params[:id])
    poll.assign_attributes(
                          title: params[:title],
                          address: params[:address],
                          city: params[:city],
                          state: params[:state],
                          )
    poll.save
    flash[:success] = "Changes successfully saved."
    redirect_to "/polls/#{poll.id}"
  end

  def finalize
    @poll = Poll.find(params[:id])
  end

  def invite
    @poll = Poll.find(params[:id])
  end

  def invite_create
    @poll = Poll.find(params[:id])
    @poll.invite(params[:invitees])
    redirect_to "/polls"
  end

  def choose
    @poll = Poll.find(params[:id])
    @appt = Appt.find(params[:appt_id])

    @poll.appts.update_all(chosen: false)
    @appt.update(chosen: true)

    flash[:success] = "Meeting time successfully finalized. We're emailing your invitees now."
    redirect_to "/polls"
  end

  # def survey

  # end

  def destroy
    poll = Poll.find(params[:id])
    poll.destroy
    flash[:warning] = "Meeting deleted."
    redirect_to "/polls"
  end
end
