class UserSessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password]) && user.activated
      session[:user_id] = user.id
      flash[:notice] = "Bol si prihlásený"
      redirect_to root_url
    else
      flash[:alert] = "Nespravny email alebo heslo"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Bol si odhlaseny."
    redirect_to new_user_session_url
  end
end
