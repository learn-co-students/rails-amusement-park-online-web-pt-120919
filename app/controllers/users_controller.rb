class UsersController < ApplicationController

  def show
      return redirect_to '/' unless logged_in?
      @user = User.find(params[:id])
      @message = params[:message] if params[:message]
      @message ||= false
  end 

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
    else
    	render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private 

  def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end 

  

end
