class User::DashboardsController < ApplicationController

  def index
    # Displays the chosen partial through links clicked on the sidebar
    case params[:clicked_link]
    when "Mes Participations"
      @render_title = "Les organisations auxquelles je participe en tant que partie prenante :"
      @render_view = "organizations/list"
      @organizations = Organization.where(external_stakeholders: ExternalStakeholder.find_by(user: current_user))
    when "Editer mon profil"
      @render_title = "Mon profil"
      @render_view = 'profiles/form'
      @profile = current_user.profile
    when "Messagerie"
      @render_title = "Mes messages"
      @render_view = 'private_messages/list'
      @private_messages = current_user.private_messages
    else 
      #news
      @organizations = Organization.all.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @render_view = "user/partials/dashboards/index/news"
      @render_title_first = "Les dernières organisations référencées sur la plateforme :"
      @render_view_first = "organizations/list"
      @private_messages = current_user.received_messages.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @render_title_second = "Mes derniers messages :"
      @render_view_second = "private_messages/list"
    end
  end

  def organizations
    # Displays the sidebar dedicated to the organizations list filtered by activity sectors
    @render_sidebar_specific_contents = ["user/partials/dashboards/organizations/sidebar_specific_content"]
    
    # Gets user-selected sector_id and organisation through params from sidebar
    sectorID_selected = params[:sectorID]
    organization_selected = params[:show]

    # Displays by default the full list of organizations
    @render_view = "organizations/list"

    # Filters organizations if an activity sector is selected
    if sectorID_selected != nil
      @render_view = "organizations/list"
      @organizations = Organization.all.reject{|organization| organization.activity_sector.id != sectorID_selected.to_i}    
    else
      @organizations = Organization.all
    end

    # Displays an organization if selected by the Show eye-button
    if organization_selected != nil
      @render_view = "organizations/show"
      @organization = Organization.find_by(id: organization_selected.to_i)
    end
  end

  def organizations_legalreps
    # Displays the sidebar for basic users followed by the dedicated section for legal representants
    @render_sidebar_specific_contents = 
      ["user/partials/dashboards/index/sidebar_specific_content",
      "user/partials/dashboards/organizations_legalreps/sidebar_specific_content"]
  end

end
