class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation
      @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end
  
  private 
  
  def user_params
    #strong params
    params.require(:user).permit(:name, :password, :password_confirmation)
    end 
    
end
