class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to login_path, warning: t('defaults.require_login')
  end

  def check_admin
    redirect_to root_path, warning: t('defaults.no_authority') unless current_user.admin?
  end

  def display_flash_message(obj)
    flash[:notice] = t('.success') if obj.valid?
  end
end
