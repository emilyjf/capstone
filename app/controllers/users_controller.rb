class UsersController < ApplicationController

  def index
    @users = current_user
  end

  def new

  end

  def create
    user = User.new(
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    name: params[:name]
                    )

    if user.save
      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(user).deliver_now

      session[:user_id] = user.id
      flash[:success] = "Account created."
      redirect_to user_url(id: user.id)
    else
      flash[:warning] = "Invalid email or password."
      redirect_to '/login'
    end
  end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      user = User.find(params[:id])
      user.assign_attributes(
                            email: params[:email],
                            password: params[:password],
                            password_confirmation: params[:password_confirmation],
                            name: params[:name]
                            )
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      flash[:warning] = "Account deleted."
      redirect_to "/"
    end
end
