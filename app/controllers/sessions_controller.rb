class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to restaurants_url, notice: "Logged in"
    else
      render :new, notice: "Wrong email/password combination"
    end
  end

  def destroy
<<<<<<< HEAD
    session[:user_id] = nil
=======
    session[:user_id] = nill
>>>>>>> e4ea9589006dc1824b48de50d56941342c946ffd
    redirect_to restaurants_url, notice: "Logged out"
  end
end
