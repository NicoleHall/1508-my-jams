class SessionsController < ApplicationController

  def new
  end

  def create
    #raise params.inspect
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      #else
      #redirect to login page, maybe flash message
    end
  end

end
