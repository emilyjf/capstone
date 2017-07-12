class ResponsesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: :create
  
#<section>
#  <% if @responses.empty? %>
#    <p>
#      Looks like you have not responded to any meeting invites. <% redirect_to "/" unless #current_user && current_user.admin %>
#    </p>
#  <% end %>
#</section>

  def new
    @response = Response.new
  end
  
  def create
    @response = Response.new(
                            user_id: params[:user][:user_id],
                            time_id: params[:time_id]
                            )
    if @response.save
      current_user.response << @response
      flash[:success] = "Response saved."
      redirect_to user_url(@user.id)
    else
      render 'new.html.erb'
    end
  end

  def edit
    @response = Response.find(params[:id])
  end

  def update
    response = Response.find(params[:id])
    response.assign_attributes(
                              user_id: params[:user][:user_id],
                              appt_id: params[:appt_id]
                              )
    response.save
    flash[:success] = "Response updated."
    redirect_to "/responses/#{response.id}"
  end
end
