class ProfilesController < ApplicationController
  before_action :already_have_profile?, only: [:new, :create]
  before_action :load_profilable, only: [:edit, :update]

  def new
    @profile = Profile.new
    render layout: 'personal_user'
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile successfully created"
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  def edit
    render layout: 'personal_user'
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Profile successfully updated"
      redirect_to current_user
    else
      render action: :edit, layout: 'personal_user'
    end
  end

  private

  def already_have_profile?
    redirect_to edit_profile_path current_user.profile if not current_user.profile.nil?
  end

  def load_profilable
    resource, id = request.path.split('/')[1, 2] # request.path => /profiles/15/edit
    @profile = resource.singularize.classify.constantize.find(id) # 自分のprofileのレコード
  end

  def profile_params
    params.require(:profile).permit(:intro)
  end

end
