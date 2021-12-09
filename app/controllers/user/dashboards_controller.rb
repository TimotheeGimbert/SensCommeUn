class User::DashboardsController < ApplicationController
  def index
    @render_view = ""
    if params[:panel] == "Mes Organisations"
      @render_view = "organizations/list"
      @organizations = current_user.organizations
    elsif params[:panel] == "Editer mon profile"
      @render_view = 'profiles/form'
      @profile = current_user.profile
    elsif params[:panel] == "Messagerie"
      @render_view = 'private_messages/list'
      @private_messages = current_user.private_messages
    else
      @render_view = "organizations/list"
      @organizations = current_user.organizations
    end
  end

  


end
