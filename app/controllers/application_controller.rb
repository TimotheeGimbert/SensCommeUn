class ApplicationController < ActionController::Base
  def has_admin_rights?
    redirect_back fallback_location: root_path unless admin_signed_in? == true
  end
end
