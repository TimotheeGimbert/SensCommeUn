class User::DashboardsController < ApplicationController
  before_action :has_legal_rep_organization_rights?, only: %i[ organizations_legalreps ]

  def index
    # Displays the chosen partial through links clicked on the sidebar
    case params[:clicked_link]
    when "Mes Participations"
      # Gets organizations where the current user is a stakeholder, then renders the appropriate partial
      @view_title = "Organisations dont je suis partie-prenante"
      @organizations = Organization.where(external_stakeholders: ExternalStakeholder.find_by(user: current_user))
      @render_view = "organizations/list"
    when "Messagerie"
      if params[:message] && params[:message] == "new"
        @view_title = "Envoyer un message"
        @render_view = "private_messages/form"
        @private_message = PrivateMessage.new
      elsif params[:message_id]
        @view_title = "Message"
        @private_message = PrivateMessage.find_by(id: params[:message_id].to_i)
        @render_view = "private_messages/show"
      else
      # Gets messages of the current user, then renders the appropriate partial
        @view_title = "Mes messages"
        @sent_messages = current_user.sent_messages
        @received_messages = current_user.received_messages
        @render_view = "private_messages/list"
      end
    when "Editer mon profil"
      # Gets the current user's profile, then renders the appropriate partial
      @profile = current_user.profile
      @render_view = "profiles/form"
    else
      # DEFAULT : Opens partial of last news and messages
      # "Les dernières actualités" 
      @view_title_section1 = "Dernières organisations référencées sur la plateforme"
      @organizations = Organization.all.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @view_title_section2 = "Mes derniers messages reçus"
      @received_messages = current_user.received_messages.sort {|a, b| b.created_at <=> a.created_at}.first(3)
      @render_view = "user/partials/news/index"
    end
  end

  def organizations
    # Gets user-selected sector_id and organisation through params from sidebar
    sectorID_selected = params[:sectorID]
    
    # Displays by default the full list of organizations
    @organizations = Organization.all
    @render_view = "organizations/list"

    # Filters organizations if an activity sector is selected
    if sectorID_selected != nil
      @organizations = Organization.all.reject{|organization| organization.activity_sector.id != sectorID_selected.to_i} 
      @render_view = "organizations/list"
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
          if params[:stakeholder_id]
            @external_stakeholder = ExternalStakeholder.find_by(id: params[:stakeholder_id])
          else 
            @external_stakeholder = ExternalStakeholder.new(organization: @organization)
          end
          @stakeholder_requests = @organization.stakeholder_requests
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

  private

  def has_legal_rep_organization_rights?
    redirect_back fallback_location: root_path unless Organization.find_by(id: params[:organization_managed].to_i).managers.include?(current_user)
  end

end