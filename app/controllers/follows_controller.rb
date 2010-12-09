class FollowsController < ApplicationController
  before_filter :authenticate

  def create
    user = User.find params[:user_id]
    current_user.follow user
    flash[:notice] = "You are now following #{user.twiddr_name}!"
    redirect_to root_path
  end
end
