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
    @user = User.find(current_user.id)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render :edit, notice: "Your information has been saved"
    else
      render :edit, notice: "Type again"
    end

  end

  def admin
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirm)
  end
end
