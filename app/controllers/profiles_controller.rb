class ProfilesController < ApplicationController
  before_action :already_have_profile?, only: [:new, :create]
  before_action :load_profilable, only: [:edit, :update]

  def new
    @profile = Profile.new
    render layout: 'personal_foreigner'
  end

  def create
    @profile = current_foreigner.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile successfully created"
      redirect_to foreigner_path current_foreigner
    else
      redirect_to foreigner_path current_foreigner
    end
  end

  def edit
    render layout: 'personal_foreigner'
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Profile successfully updated"
      redirect_to foreigner_path current_foreigner
    else
      render action: :edit, layout: 'personal_foreigner'
    end
  end

  private

  def already_have_profile?
    redirect_to edit_profile_path current_foreigner.profile if not current_foreigner.profile.nil?
  end

  def load_profilable
    resource, id = request.path.split('/')[1, 2] # request.path => /profiles/15/edit
    @profile = resource.singularize.classify.constantize.find(id) # 自分のprofileのレコード
  end

  def profile_params
    params.require(:profile).permit(:intro)
  end
end
