class SessionController < ApplicationController

  def new

  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :back
    else
      session[:user_id] = nil
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to game_root_path
  end
end
