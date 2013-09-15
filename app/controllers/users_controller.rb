class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
 
    @user.save
    redirect_to '/session_index'
  end
  
  def change
    @user = User.add(params[:user])
  end
  
  def show
    @user = User.find(2)
    redirect_to '/session_index'
  end
  
  def index
  end
  
  def search
    @users = User.search params[:search]
  end
  
end
