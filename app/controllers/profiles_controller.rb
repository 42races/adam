class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :load_profile, only: [:edit, :update]

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile

    if @profile.update_attributes(profile_params)
      @notice = 'Profile updated successfully'
    end

    render action: :edit
  end

  def show
    @profile = Profile.find_by_username(params[:username])
  end

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      @notice = 'Profile updated successfully'
    end

    render action: :edit
  end

  private

  def load_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :profile_pic, :username, :dob)
  end

end
