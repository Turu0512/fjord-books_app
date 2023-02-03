# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super
    resource.avatar.attach(params[:avatar])
  end
end
