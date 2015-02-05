class UserController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.lower_username = params[:user][:username].downcase
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
    if session[:user_id]
      redirect_to profile_path(params[:game], User.find(session[:user_id]).profile)
    else
      @user = User.new
      @profile = Profile.new
    end
  end

  def check_email
    user = User.where(email: params[:email].downcase)
    if (user.exists?)
      render json: { status: "fail" }
    else
      render json: { status: "ok" }
    end
  end

  def check_username
    user = User.where(lower_username: params[:username].downcase)
    if (user.exists?)
      render json: { status: "fail" }
    else
      render json: { status: "ok" }
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end
