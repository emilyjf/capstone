class MailersController < ApplicationController
  def show
    @poll = Poll.find(params[:id])
    @user = User.find(params[:id])
  end
end
