class MailersController < ApplicationController
  def show
    @poll = Poll.find(params[:id])
    @user = User
  end
end
