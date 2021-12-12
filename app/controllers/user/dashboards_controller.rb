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
    organization_id = params[:organization_id]
    if organization_id != nil
      @render_view = "organizations/show"
      @organization = Organization.find_by(id: organization_id.to_i)
    end

    # Displays form for stakholder_request
    
    if params[:show] && params[:show] == "StakeholderRequest"
      @stakeholder_request = StakeholderRequest.new()
    end
    puts "#"*100
    puts @stakeholder_request
  end

  def organizations_legalreps
    # Displays the sidebar for basic users followed by the dedicated section for legal representants
    @render_sidebar_specific_contents = 
      ["user/partials/dashboards/index/sidebar_specific_content",
      "user/partials/dashboards/organizations_legalreps/sidebar_specific_content"]
    if params[:organization_managed]
      @organization = Organization.find_by(id: params[:organization_managed].to_i)

      if params[:clicked_link]
        case params[:clicked_link]
        when "Éditer les informations"
          @render_view_title = "Éditer les informations de l'organisation"
          @render_view = "organizations/form"
        when "Parties prenantes"
          @all_external_stakeholders = @organization.external_stakeholders
          @render_view_title = "Gérer les parties prenantes de l'organisation"
          @render_view = "user/partials/dashboards/organizations_legalreps/external_stakeholders.html.erb"
          @external_stakeholders_category = StakeholderCategory.all.sort {|a, b| a.name <=> b.name}
          @external_stakeholder = ExternalStakeholder.new(organization: @organization)
          @stakeholder_requests = @organization.stakeholder_requests
          
        when "Documents"
          @render_view_title = "Bientôt dans votre tableau de bord..."
          @render_view = "user/partials/soon"
        when "Présentations"
          @render_view_title = "Bientôt dans votre tableau de bord..."
          @render_view = "user/partials/soon"
        end
      else
        @render_view_title = "Informations de l'organisation"
        @render_view = "organizations/show"
      end
    end
  end

end
