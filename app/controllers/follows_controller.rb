class FollowsController < ApplicationController

  def create
    @other_user = User.find(params[:user_id])
    @fol = Follow.new(follower_id: current_user.id, followed_id: @other_user.id)
    respond_to do |format|
      if @fol.save
        format.turbo_stream
        format.html { redirect_to user_path(@other_user)}
      end
    end
  end

  def destroy
    @fol = Follow.find(params[:id])
    respond_to do |format|
      if @fol.destroy
        format.turbo_stream
        format.html { redirect_to user_path(@fol.followed_id)}
      end
    end
  end
end
