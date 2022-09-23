# frozen_string_literal: true

include ApplicationHelper

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    user_path(resource)
  end
end
