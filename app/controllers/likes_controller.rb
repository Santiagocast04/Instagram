class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(likeable_id: 17, likeable_type: "Post")
    @post = @like.likeable
    respond_to do |format|
      if @like.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('like_button', partial: "posts/post", locals: { post: @post})
        end
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = current_user.likes.find_by(params[:like])
    respond_to do |format|
      if @like.destroy
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@like) }

        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
