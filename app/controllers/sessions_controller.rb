class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end

  def new; end

  def create
    @user = User.find_by(name: params[:login][:name])
    if @user
      session[:current_user] = @user
      flash[:notice] = 'You have successfully logged in.'
      redirect_to root_path
    else
      flash.now[:notice] = 'This username is incorrect'
      render 'new'
    end
  end
end
