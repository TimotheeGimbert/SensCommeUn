class User::DashboardsController < ApplicationController

  def index
    # Displays the initial sidebar specific to User
    @render_sidebar_specific_contents = ["user/partials/dashboards/index/sidebar_specific_content"]

    # Displays the chosen partial through links clicked on the sidebar
    case params[:clicked_link]
    when "Mes Participations"
      @render_view = "organizations/list"
      @organizations = current_user.organizations
    when "Les dernières actualités"
      @organizations = Organization.all.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @render_view = "user/partials/dashboards/index/news"
      @render_view_first = "organizations/list"
    when "Editer mon profile"
      @render_view = 'profiles/form'
      @profile = current_user.profile
    when "Messagerie"
      @render_view = 'private_messages/list'
      @private_messages = current_user.private_messages
    else
      @render_view = "organizations/list"
      @organizations = current_user.organizations
    end
  end

  def organizations
    # Displays the sidebar dedicated to the organizations list filtered by activity sectors
    @render_sidebar_specific_contents = ["user/partials/dashboards/organizations/sidebar_specific_content"]
    
    sector_selected = params[:sector]
    organization_selected = params[:show]
    
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
