class UsersController < ApplicationController
  def show
    @user = current_user
    @post = current_user.posts
  end
end