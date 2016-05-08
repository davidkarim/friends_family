class SessionsController < ApplicationController
  def new
  end

  def create
    user = TruckOwner.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Login the user
      log_in user # Calls module defined in helpers module
      redirect_to user # Rails converts this redirect to route for user's profile page.
      # binding.pry
    else
      # Create an error message here
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out"
    redirect_to root_path
  end
end
