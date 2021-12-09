class Admin::DashboardsController < ApplicationController
  before_action :has_admin_rights? #That is a double security, as this controller's access is already locked by the devise_scope

  def index
  end

end
