class UserRegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:notice] = "Ďakujeme za registráciu, teraz sa môžeš prihlásiť."
      redirect_to root_path
    else
      flash[:alert] = "Pri registrácii nastala chyba."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
