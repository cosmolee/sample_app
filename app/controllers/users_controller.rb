class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user  # Note that we can omit `user_path` in the redirect - listing 7.25
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
