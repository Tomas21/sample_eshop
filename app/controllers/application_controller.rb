class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_menu_items

  private

  def require_admin_session
    unless session[:logged]
      flash[:alert] = "Pre vstup do adminu sa musis prihlasit"
      redirect_to new_admin_session_url
    end
  end

  def load_menu_items
    @items = [
      ['Blog', posts_path],
      ['Kontakt', contact_path],
      ['Google', 'http://google.sk']
    ]
  end
end
