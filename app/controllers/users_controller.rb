class UsersController < ApplicationController
  def show
    @user = current_user
    @post = Post.find_by(params[:id])
  end
end
