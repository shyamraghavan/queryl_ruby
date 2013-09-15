class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
        session[:userid] = user.id
        redirect_to "/show", notice: "Logged in!"
    else
        flash[:error] = "Wrong Username or Password."
        redirect_to "/signup"
    end
  end

  def destroy
    session[:userid] = nil
    redirect_to root_url, notice: "Logged out."
  end
end
