# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @follow_relationsihp = current_user.followings.find_by(id: @user.id)
  end

  def followings
    @user  = User.find(params[:id])
    @users = @user.followings.page(params[:page])
    render 'following_list'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.with_attached_avatar.page(params[:page])
    render 'followers_list'
  end
end
