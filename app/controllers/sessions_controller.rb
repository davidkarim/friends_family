class SessionsController < ApplicationController
  def new
  end

  def create
    user = TruckOwner.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Login the user
    else
      # Create an error message here
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy

  end
end
