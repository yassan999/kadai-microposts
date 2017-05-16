class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @user = current_user
      @microposts = current_user.favoriting.page(params[:page])
    end
  end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favo(micropost)
    flash[:success] = 'ファボしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavo(micropost)
    flash[:success] = 'ファボを消しました。'
    redirect_back(fallback_location: root_path)
  end
end
