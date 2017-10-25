class SessionsController < ApplicationController

  def new
  end

  def create
    # if ( params[:email].empty? || params[:password].empty? )
    #   flash[:notice] = "Fields can't be blank"
    #   render :new
    #   params[:email] = nil
    # else
      user = User.find_by(email: params[:email])

      if user && user.authenticate( params[:password] )
        session[:user_id] = user.id
        redirect_to restaurants_url, notice: "Logged in"
      else
        flash[:notice] = "Wrong email/password combination"
        render :new
      end
    # end
  end

  def destroy

    session[:user_id] = nil
    redirect_to restaurants_url, notice: "Logged out"
  end

end
