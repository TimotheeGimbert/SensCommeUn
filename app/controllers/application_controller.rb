class ApplicationController < ActionController::Base
  def is_admin?
    redirect_back fallback_location: root_path unless admin_signed_in? == true
  end
end
