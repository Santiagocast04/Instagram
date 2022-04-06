class FollowsController < ApplicationController

  def create
    other_user = User.find(params[:user_id])
    @fol = Follow.new(follower_id: current_user.id, followed_id: other_user.id)

    @fol.save
    redirect_to user_path(other_user)
  end

  def destroy
    @fol = Follow.find(params[:id])
    @fol.destroy
    redirect_to user_path(@fol.followed_id)
  end
end
