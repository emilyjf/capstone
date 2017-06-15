class PollsController < ApplicationController
  
  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(
                    admin_id: params[:admin][:admin_id],
                    title: params[:title],
                    status: params[:status],
                    invitee: params[:invitee],
                    location: params[:location]
                    )
    if @poll.save
      flash[:success] = "Poll created."
      redirect_to "/polls/#{poll.id}"
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
    flash[:success] = "Poll updated."
    redirect_to "/polls/#{poll.id}"
  end

  def destroy
    poll = Poll.find(params[:id])
    poll.destroy
    flash[:warning] = "Poll deleted."
    redirect_to "/"
  end
end
