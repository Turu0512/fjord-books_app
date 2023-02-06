# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show followings followers]
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @follow_relationsihp = current_user.followings.find_by(id: @user.id)
  end

  def followings
    @users = @user.followings.page(params[:page])
    render 'following_list'
  end

  def followers
    @users = @user.followers.with_attached_avatar.page(params[:page])
    render 'followers_list'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
