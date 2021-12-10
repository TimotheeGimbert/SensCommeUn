class User::DashboardsController < ApplicationController
  def index

    @sidebar_links = ["Mes Participations","Les dernières actualités",'Messagerie']
    @render_view = ""
    @render_sidebar_specific_contents = ["user/partials/dashboards/index/sidebar_specific_content"]
    if params[:panel] == "Mes Participations"
      @render_view = "organizations/list"
      @organizations = current_user.organizations
    elsif params[:panel] == "Les dernières actualités"
      @organizations = Organization.all.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @render_view = "user/partials/dashboards/index/news"
      @render_view_first = "organizations/list"
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

  def organizations
    @render_sidebar_specific_contents = ["user/partials/dashboards/organizations/sidebar_specific_content"]
    @sidebar_links = []
    sector_selected = params[:sector]
    organization_selected = params[:show]
    ActivitySector.all.each {|sector| @sidebar_links.push({id:sector.id, label:sector.name})}
    @view_render = "organizations/list"
    if sector_selected != nil
      @view_render = "organizations/list"
      @organizations = Organization.all.reject{|organization| organization.activity_sector.id != sector_selected.to_i}    
    else
      @organizations = Organization.all
    end
    if organization_selected != nil
      @view_render = "organizations/show"
      @organization = Organization.find_by(id: organization_selected.to_i)
    end
  end

  def organizations_legalreps
    @render_sidebar_specific_contents = ["user/partials/dashboards/index/sidebar_specific_content","user/partials/dashboards/organizations_legal_reps/sidebar_specific_content"]
  end
end
