# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super
    resource.avatar.attach(account_update_params[:avatar]) if account_update_params[:avatar].present?
  end
end
