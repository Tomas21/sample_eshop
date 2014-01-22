class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_menu_items

  private

  def load_menu_items
    @items = [
      ['Blog', posts_path],
      ['Kontakt', contact_path],
      ['Google', 'http://google.sk']
    ]
  end
end
