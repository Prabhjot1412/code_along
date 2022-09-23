# frozen_string_literal: true

# overiding Invitation controller
class Users::InvitationsController < Devise::InvitationsController
  def create
    @user = User.where(email: params[:user][:email])
    return if  params[:user][:email].empty?
    @user.empty? ? super : create_alert_and_redirect('email address already in use or invited', new_user_invitation_path)
  end
end