class Admin::DashboardsController < ApplicationController
  before_action :has_admin_rights? #That is a double security, as this controller's access is already locked by the devise_scope

  def index
    @render_view = ""
    if params[:panel] == "Gestions des utilisateurs"
      @render_view = "user/partials/list"
      @users = User.all
    elsif params[:panel] == "Gestion des Organisations"
      @render_view = "organizations/list"
      @organizations = Organization.all
    elsif params[:panel] == "Création d'une organisation"
      @render_view = 'organizations/form'
      @organization = Organization.new
    elsif params[:panel] == "Messagerie"
      @render_view = 'private_messages/list'
      @private_messages = current_admin.private_messages
    else
      @render_view = "organizations/list"
      @organizations = Organization.all
    end
  end

end
