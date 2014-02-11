class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_menu_items
  before_action :set_locale
  helper_method :current_admin

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_admin
    @current_admin ||= AdminUser.where(id: session[:admin_user_id]).first
  end

  def require_admin_session
    unless current_admin
      flash[:alert] = "Pre vstup do adminu sa musis prihlasit"
      redirect_to new_admin_session_url
    end
  end

  def load_menu_items
    @navigation_items = [
      ['Blog', posts_path],
      ['Eshop', products_path],
      ['Nakupny kosik', cart_items_path],
      ['Kontakt', contact_path],
      ['Google', 'http://google.sk'],
      ['Registracia', new_user_path]
    ]
  end
end
