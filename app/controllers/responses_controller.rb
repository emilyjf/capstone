class ResponsesController < ApplicationController
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
                              time_id: params[:time_id]
                              )
    response.save
    flash[:success] = "Response updated."
    redirect_to "/responses/#{response.id}"
  end
end
