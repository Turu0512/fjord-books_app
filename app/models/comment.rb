# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :comment, polymorphic: true
  belongs_to :user
  validates :text, presence: true

  def display_user_name
    if user.blank?
      I18n.t('users.show.not_found')
    elsif user.name.blank?
      user.email
    else
      user.name
    end
  end
end
