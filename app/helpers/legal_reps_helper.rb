module LegalRepsHelper
  def current_user_is_legalrep?
    return true unless current_user.managed_organizations.empty?
  end
end
