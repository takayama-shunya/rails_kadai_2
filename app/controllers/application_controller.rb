class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :login_check_user

  private
  def login_check_user
    unless logged_in? 
      flash[:notice] = 'ログインして下さい'
      redirect_to new_session_path
    end
  end

end
