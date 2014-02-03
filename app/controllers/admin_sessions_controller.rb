class AdminSessionsController < ApplicationController

  layout "admin"
  
  def new
  end

  def create
    if (params[:email] == "jano@gmail.com" && params[:password] == "123")
      session[:logged] = true
      redirect_to admin_posts_url
    else
      flash[:alert] = "Nespravny email alebo heslo"
      render :new
    end
  end

  def destroy
    session[:logged] = nil
    flash[:alert] = "Bol si odhlaseny."
    redirect_to new_admin_session_url
  end

end
