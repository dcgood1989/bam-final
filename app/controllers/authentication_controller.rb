class AuthenticationController < ApplicationController

  def new
    @user = User.new
  end

  def destroy
    session.clear
    flash[:notice] = "Signed out!"
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Thanks for signing in!"
    else
      flash[:notice] = "User could not be authenticated. Please try again."
      render :new
    end
  end
end
