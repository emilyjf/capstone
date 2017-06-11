class UsersController < ApplicationController
  def new

  end

  def create
    user = User.new(
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )

    if user.save
      session[:user_id] = user.user_id
      flash[:success] = "Account created."
      redirect_to "/"
    else
      flash[:warning] = "Invalid email or password."
      redirect_to "/"
    end
  end
end
