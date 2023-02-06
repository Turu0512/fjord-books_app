# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    active_relationship = current_user.active_relationships.find(params[:id])
    followed_user = active_relationship.followed
    current_user.unfollow(active_relationship)
    redirect_to followed_user
  end
end
