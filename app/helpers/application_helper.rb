# frozen_string_literal: true

# Helper Module
module ApplicationHelper
	include Pagy::Frontend
	
  def provider_finder(provider)
    if provider == :google_oauth2
      OmniAuth::Utils.camelize(:google)
    else
      OmniAuth::Utils.camelize(provider)
    end
  end

  def create_alert_and_redirect(message, redirecting_path)
    flash[:alert] = message
    redirect_to redirecting_path
 end
end

