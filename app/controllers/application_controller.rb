class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  before_action :set_current_user
  before_action :set_wards

  private

  def set_current_user
    Current.user = current_user if current_user.present?
  end

  def set_wards
    @wards = Ward.where(show_on_homepage: false)
  end

  def not_authenticated
    redirect_to login_path, danger: "Please login first"
  end
end
