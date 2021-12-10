class ApplicationController < ActionController::Base

  def has_user_rights?
    redirect_back fallback_location: root_path unless (user_signed_in? == true || admin_signed_in? == true)
  end

  def has_admin_rights?
    redirect_back fallback_location: root_path unless admin_signed_in? == true
  end

  def has_legal_rep_rights?
    redirect_back fallback_location: root_path unless is_legal_rep?(current_user) == true
  end

  def is_legal_rep?(user)
   
  end

end
