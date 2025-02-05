class ApplicationController < ActionController::Base
  include Authentication

  allow_browser versions: :modern
  around_action :switch_locale # runs on every request

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
