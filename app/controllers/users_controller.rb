class UsersController < ApplicationController
  def new
    
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render new
    end
  end
  def signin
    
  end
  def edit
  end

  def show
    if !logged_in?
      redirect_to root_path
    end
    @user = User.find_by(id: params[:id])
    
  end

  def users_params
    params.require(:user).permit(:name, :password, :nausea, :height, :admin, :tickets, :happiness)
  end
end
