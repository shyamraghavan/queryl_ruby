class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:name, :email, :password, :password_confirmation])
 
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/show", notice: "Thank you for signing up for Queryl!"
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  
end
