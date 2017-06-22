class UserPollsController < ApplicationController
  before_action :authenticate_user!

def create
  @userpoll = Userpoll.new(
                          user_id: params[:user][:user_id],
                          poll_id: params[:poll_id]
                          )

    if @userpoll.save
      current_user.userpoll << @userpoll
      flash[:success] = "Userpoll saved."
      redirect_to user_url(@user.id)
    else
      render 'new.html.erb'
    end
  end
end
