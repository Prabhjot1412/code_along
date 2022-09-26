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

 def markdown(text)
  return '' if text.nil?

  render_options = { hard_wrap: true, link_attributes: { target: '_blank' } }
  extensions = { fenced_code_blocks: true, strikethrough: true, tables: true, autolink: true }
  renderer = Redcarpet::Render::HTML.new(render_options)
  Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
end
end
