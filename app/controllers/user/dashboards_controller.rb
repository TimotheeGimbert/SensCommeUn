class User::DashboardsController < ApplicationController
  def index

    @sidebar_links = ["Mes Organisations","Les dernières actualités",'Messagerie']
    @render_view = ""

    if params[:panel] == "Mes Organisations"
      @render_view = "organizations/list"
      @organizations = current_user.organizations
    elsif params[:panel] == "Les dernières actualités"
      @organizations = Organization.all.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @render_view = "user/dashboards/news"
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
    @sidebar_links = []
    sector_selected = params[:sector]
    organization_selected = params[:show]
    ActivitySector.all.each {|sector| @sidebar_links.push({id:sector.id, label:sector.name})}
    puts "#" * 100
    puts 
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
end
