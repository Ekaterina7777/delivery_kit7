class ProfilesController < ApplicationController
  before_action :set_user_profile, only: [:edit, :update, :destroy]
  def show
  end
    
  def logout
     reset_session
     redirect_to root_path
  end


  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_url, notice: 'Профиль успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_url, notice: 'Профиль успешно удален'
  end

  private

  def set_user_profile
    @profile = current_user
  end

  def profile_params
    params.permit(:last_name, :first_name,) 
  end

end
