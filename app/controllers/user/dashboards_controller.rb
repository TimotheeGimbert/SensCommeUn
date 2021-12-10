class User::DashboardsController < ApplicationController
  def index

    @sidebar_links = ["Mes Participations","Les dernières actualités",'Liste des messages', "Écrire un message"]
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
    elsif params[:panel] == "Liste des messages"
      @render_view = 'private_messages/list'
      @private_messages = current_user.private_messages
    elsif params[:panel] == "Écrire un message"
      @render_view = 'user/partials/dashboards/index/send_message'
      @join_messages_recipient = JoinMessagesRecipient.new
      @private_message = PrivateMessage.create(author: current_user)
      @users_email = []
      User.all.each{|user|@users_email.push(user.email)}
    else
      @render_view = "organizations/list"
      @organizations = current_user.organizations
    end
  end

  def organizations
    @render_sidebar_specific_contents = ["user/partials/dashboards/organizations/sidebar_specific_content"]
    @sidebar_links_dedicated = []
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
    @sidebar_links = ["Mes Participations","Les dernières actualités",'Messagerie']
    @sidebar_links_dedicated = []
    current_user.managed_organizations.each do |organization|
      @sidebar_links_dedicated.push({label: organization.name, id: organization.id})
    end
    puts "#"*100
    puts @sidebar_links_dedicated
    @render_sidebar_specific_contents = ["user/partials/dashboards/index/sidebar_specific_content",
                                         "user/partials/dashboards/organizations_legalreps/sidebar_specific_content"
                                        ]
  end
end
