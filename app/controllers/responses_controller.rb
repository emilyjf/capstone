class ResponsesController < ApplicationController
  def create
    @response = Response.new(
                            user_id: params[:user][:user_id],
                            time_id: params[:time_id]
                            )
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
  end

end
