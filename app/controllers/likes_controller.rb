class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(like_params)
    respond_to do |format|
      if @like.save
        format.turbo_stream
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = current_user.likes.find_by(likeable_id: params[:id], likeable_type: Post.name)
    if @like.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def like_params
    params.permit(:likeable_id, :likeable_type)
  end
end
