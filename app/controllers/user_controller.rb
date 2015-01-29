class UserController < ApplicationController
  def create
    @user = User.new(user_params)
    @profile = Profile.new
    if @user.save
      @profile.user_id = @user.id
      @profile.avatar_url = "avatars/ava.jpg"
      if @profile.save
        session[:user_id] = @user.id
        redirect_to game_root_path
      else
        @user.destroy
        render 'new'
      end
    else
      render 'new'
    end
  end

  def new
    @user = User.new
    @profile = Profile.new
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end