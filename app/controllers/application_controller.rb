class ApplicationController < ActionController::Base

  def has_admin_rights?
    redirect_back fallback_location: root_path unless admin_signed_in? == true
  end
  
  def has_user_rights?
    redirect_back fallback_location: root_path unless (user_signed_in? == true || admin_signed_in? == true)
  end

  def has_legal_rep_rights?
    redirect_back fallback_location: root_path unless (LegalRep.exists?(user: current_user) == true || admin_signed_in? == true)
  end

  def current_user?
    redirect_back fallback_location: root_path unless current_user.profile.id == @profile.id
  end
end
