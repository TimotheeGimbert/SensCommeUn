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
    ActivitySector.all.each do |sector|
       @sidebar_links.push({id:sector.id, label:sector.name})
    end
    puts "#" *60
    p @sidebar_links
    @organizations = Organization.all
  end
end
