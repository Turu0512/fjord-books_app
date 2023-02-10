# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_relationships, class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :passive_relationships, class_name: 'FollowRelationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  # ユーザーをフォローする
  def follow(other_user)
    followings << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(active_relationship)
    active_relationship.destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    followings.exists?(other_user)
  end
end
