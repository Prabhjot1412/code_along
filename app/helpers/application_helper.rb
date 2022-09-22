# frozen_string_literal: true

# Helper Module
module ApplicationHelper
  def provider_finder(provider)
    if provider == :google_oauth2
      OmniAuth::Utils.camelize(:google)
    else
      OmniAuth::Utils.camelize(provider)
    end
  end
end
