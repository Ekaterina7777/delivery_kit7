class ProfilesController < ApplicationController
  before_action :set_user_profile, only: [:edit, :update]
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

  
  private

  def set_user_profile
    @profile = current_user
  end

  def profile_params
    params.permit(:last_name, :first_name,) # Здесь добавьте другие поля профиля, которые вы хотите редактировать
  end
end
