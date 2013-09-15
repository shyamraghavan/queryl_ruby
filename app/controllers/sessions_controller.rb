class SessionsController < ApplicationController
  
  userA = User.new;
  
  def get_user_A
    return userA
  end
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:error] = "Account Created."
      
      userA = user
      
      redirect_to "/session_index"
    else
        flash[:error] = "Wrong Username or Password."
        redirect_to "/"
    end
  end

  def destroy
    session[:userid] = nil
    redirect_to root_url, notice: "Logged out."
  end
  
  def index
  end
 
end
