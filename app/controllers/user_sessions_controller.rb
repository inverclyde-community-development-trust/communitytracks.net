class UserSessionsController < ApplicationController
  layout "auth"

  def new
    if current_user.present?
      redirect_back_or_to(root_path)
    else
      @user = User.new(remember: true, email: params[:email])
    end
  end

  def create
    if @user = login(session_params[:email], session_params[:password], session_params[:remember] == "true")
      redirect_back_or_to(root_path, success: "Login successful")
    else
      flash[:warning] = "Login failed"
      redirect_to login_path(email: session_params[:email])
    end
  end

  def destroy
    logout
    redirect_to(root_path, success: "Logged out!")
  end

  private

  def session_params
    params.require(:user).permit(:email, :password, :remember)
  end
end
