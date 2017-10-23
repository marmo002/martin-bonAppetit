class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name} has been saved!"
      # Log user in
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Please fix errors"
      render :new
    end
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
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirm)
  end
end
