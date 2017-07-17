class ResponsesController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery except: :create
  
#<section>
#  <% if @responses.empty? %>
#    <p>
#      Looks like you have not responded to any meeting invites. <% redirect_to "/" unless #current_user && current_user.admin %>
#    </p>
#  <% end %>
#</section>
  def index

  end

  def new
    @response = Response.new
  end
  
  def create

    @poll = Poll.find(params[:poll_id])
    @appt_responses = params[:appts]

    @appt_responses.each do |appt_id, appt_response|
      response = Response.find_or_create_by(user_id: current_user.id, appt_id: appt_id)
      response.update(answer: appt_response)
    end

    redirect_to "/polls"
  end

  def show
    @response = Response.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @response = Response.find(params[:id])
  end

  def update
    response = Response.find(params[:id])
    # response.assign_attributes(
    #                           user_id: params[:user][:user_id],
    #                           appt_id: params[:appt_id],
                                 # answer: params[:answer]
    #                           )

    response.update!(answer: params[:answer])
    
    flash[:success] = "Response updated."
    redirect_to "/responses/#{response.id}"
  end
end
