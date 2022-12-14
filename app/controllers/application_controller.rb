# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ApplicationHelper
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    user_path(resource)
  end
end
