class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
 
    @user.save
    redirect_to @user
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    redirect_to '/'
  end
  
end
