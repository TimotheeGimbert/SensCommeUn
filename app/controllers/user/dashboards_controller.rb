class User::DashboardsController < ApplicationController

  def index
    # Displays the chosen partial through links clicked on the sidebar
    case params[:clicked_link]
    when "Mes Participations"
      # Gets organizations where the current user is a stakeholder, then renders the appropriate partial
      @view_title = "Organisations dont je suis partie-prenante"
      @organizations = Organization.where(external_stakeholders: ExternalStakeholder.find_by(user: current_user))
      @render_view = "organizations/list"
    when "Messagerie"
      # Gets messages of the current user, then renders the appropriate partial
      @view_title = "Mes messages"
      @private_messages = current_user.private_messages
      @render_view = "private_messages/list" 
    when "Editer mon profil"
      # Gets the current user's profile, then renders the appropriate partial
      @profile = current_user.profile
      @render_view = "profiles/form"
    else
      # Opens partial of last news and messages
      # "Les dernières actualités" 
      @view_title_section1 = "Dernières organisations référencées sur la plateforme"
      @organizations = Organization.all.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @view_title_section2 = "Mes derniers messages reçus"
      @private_messages = current_user.received_messages.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @render_view = "user/partials/news/index"
    end
  end

  def organizations
    # Gets user-selected sector_id and organisation through params from sidebar
    sectorID_selected = params[:sectorID]
    organization_selected = params[:show]

    # Displays by default the full list of organizations
    @organizations = Organization.all
    @render_view = "organizations/list"

    # Filters organizations if an activity sector is selected
    if sectorID_selected != nil
      @organizations = Organization.all.reject{|organization| organization.activity_sector.id != sectorID_selected.to_i} 
      @render_view = "organizations/list"
    end

    # Displays an organization if selected by the Show eye-button
    if organization_selected != nil
      @organization = Organization.find_by(id: organization_selected.to_i)
      @render_view = "organizations/show" 
    end
  end

  def organizations_legalreps
    if params[:organization_managed]
      # Gets organizations managed by the legal representant
      @organization = Organization.find_by(id: params[:organization_managed].to_i)
      if params[:clicked_link]
        case params[:clicked_link]
        when "Éditer les informations"
          @view_title = "Éditer les informations de l'organisation"
          @render_view = "organizations/form"
        when "Parties prenantes"
          @all_external_stakeholders = @organization.external_stakeholders
          @external_stakeholder = ExternalStakeholder.new(organization: @organization)
          @external_stakeholders_category = StakeholderCategory.all.sort {|a, b| a.name <=> b.name}
          @view_title = "Gérer les parties prenantes de l'organisation"
          @render_view = "user/partials/dashboards/organizations_legalreps/external_stakeholders.html.erb"
        when "Documents"
          @view_title = "Bientôt dans votre tableau de bord..."
          @render_view = "user/partials/soon"
        when "Présentations"
          @view_title = "Bientôt dans votre tableau de bord..."
          @render_view = "user/partials/soon"
        end
      else
        @render_view = "organizations/show"
      end
    end
  end

end
