class UserConfirmationsController < ApplicationController

  def create
    @user = User.where(token: params[:token]).first
    
    if @user
      @user.activated = true
      @user.token = nil
      @user.save
      flash[:notice] = "Tvoj ucet bol aktivovany"
    else
      flash[:alert] = "Chybný token"
    end

    redirect_to root_url
  end

end
