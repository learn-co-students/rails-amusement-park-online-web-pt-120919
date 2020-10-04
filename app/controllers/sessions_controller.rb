class SessionsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.alert = "*Wrong email or password. Try again."
      redirect_to root_path
    end
  end
  def logout
    session.destroy
    redirect_to root_path
  end
end
