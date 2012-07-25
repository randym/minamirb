class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery
  def set_locale
    # This is cheating - in a real app you would want to be setting this off the URL or client browser settings
    I18n.locale = :ja
  end
end
