class User::DashboardsController < ApplicationController
  def index

    @sidebar_links = ["Mes Organisations","Les dernières actualités",'Messagerie']
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

  def organizations
    @sidebar_links = []
    sector_selected = params[:sector]
    ActivitySector.all.each {|sector| @sidebar_links.push({id:sector.id, label:sector.name})}
    puts "#" * 100
    puts 
    if sector_selected != nil
      @organizations = Organization.all.reject{|organization| organization.activity_sector.id.to_s != sector_selected}    
    else
      @organizations = Organization.all
    end
  end
end
