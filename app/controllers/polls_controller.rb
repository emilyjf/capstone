class PollsController < ApplicationController
  before_action :authenticate_user!

  def index
    @polls = current_user.polls.all
    @responses = current_user.responses
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(
                    admin_id: current_user.id,
                    title: params[:title],
                    status: params[:status],
                    invitee: params[:invitee],
                    location: params[:location]
                    )
    if @poll.save
      current_user.polls << @poll
      #current_user.save
      flash[:success] = "Poll created."
      redirect_to appts_url(@poll.id)
    else
      render 'new.html.erb'
    end
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    poll = Poll.find(params[:id])
    poll.assign_attributes(
                          admin_id: params[:admin][:admin_id],
                          title: params[:title],
                          status: params[:status],
                          invitee: params[:invitee],
                          location: params[:location]
                          )
    poll.save
    flash[:success] = "Meeting updated."
    redirect_to "/polls/#{poll.id}"
  end

  def destroy
    poll = Poll.find(params[:id])
    poll.destroy
    flash[:warning] = "Meeting deleted."
    redirect_to "/polls"
  end
end
