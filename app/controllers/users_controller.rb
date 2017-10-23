class UsersController < ApplicationController

  def new
    @user = User.all
  end

  def create
    @user = User.new(@params)
    if @user.save
      flash[:notice] = "#{@user.name} has been saved!"
      # Log user in
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Please fix errors"
      render :new
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password)
  end
end
