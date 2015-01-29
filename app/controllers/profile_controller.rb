class ProfileController < ApplicationController
  def update

  end

  def show
    @profile = Profile.find(params[:id])
  end
end
