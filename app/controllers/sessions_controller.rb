class SessionsController < ApplicationController

  def new
  end

  def create

    if params[:email].present?
      if valid_email?(params[:email])
        if params[:password].present?
          user = User.find_by(email: params[:email])
          if user && user.authenticate( params[:password] )
            session[:user_id] = user.id
            redirect_to restaurants_url
          else
            flash[:notice] = "Wrong email/password combination"
            render :new
            flash.clear
          end
        else
          flash[:notice] = "Password field can't be blank"
          render :new
          flash.clear
        end
      else
        flash[:notice] = "Try to type a email please"
        render :new
        flash.clear
      end
    else
      flash[:notice] = "Email field can't be blank"
      render :new
      flash.clear
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_url
  end

  private
  def valid_email?(email)
    rex = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
    if email.match(rex)
      return  true
    else
      return false
    end
  end
end
