class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]
  before_action :has_user_rights?, only: %i[ index show ]
  before_action :has_legal_rep_organization_rights?, only: %i[ edit update ]
  before_action :has_admin_rights?, only: %i[ new create destroy ]

  # GET /organizations
  def index
    @organizations = Organization.all
    sidebar_organizations()
    @view_title = "Organisations"
    case params[:selected]
      when "organizations_participation"
        # Gets organizations where the current user is a stakeholder, then renders the appropriate partial
        @view_title = "Organisations dont je suis partie-prenante"
        @organizations = Organization.where(external_stakeholders: ExternalStakeholder.find_by(user: current_user))
    end
  end

  # GET /organizations/1
  def show
    sidebar_organizations()
    if params[:show] && params[:show] == "StakeholderRequest"
      @stakeholder_request = StakeholderRequest.new()
    end
    if @organization.managers.include?(current_user)
      session[:organization_managed_id] = @organization.id
    end
  end

  # GET /organizations/new
  def new
    @users = User.all
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)
    legal_rep_associated = organization_params[:add_manager]
    organization_params.delete('add_manager')
    respond_to do |format|
      if @organization.save
        LegalRep.create(organization: @organization, user: User.find_by(id: legal_rep_associated.to_i))
        format.html { redirect_to @organization, success: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if (params[:logo])
      @organization.logo.attach(params[:logo])
    end
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization , success: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, success: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def create_logo
      @organization = Organization.find(params[:organization_id])
      @organization.logo.attach(params[:logo])
      redirect_to user_organizations_legalreps_path(organization_managed: @organization.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def has_legal_rep_organization_rights?
      redirect_back fallback_location: root_path unless Organization.find_by(id: params[:id]).managers.include?(current_user)
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name, :nickname, :creation_date, :address, :address_complement, :zip_code, :city_id, :email, :phone_number, :status_id, :siren, :description, :activity_sector_id, :naf_ape, :logo_url, :website_url, :logo, :add_manager)
    end
    def sidebar_organizations()
      if params[:search_by]
        
        @sidebar_links =[]
        case params[:search_by]
          when "geo_zones"
            @sidebar_title = "Zones géographiques"
            City.all.each { |city| @sidebar_links.push( {id:city.id, label:city.name} ) }
            if params[:categ_id]
              @organizations = Organization.all.reject{|organization| organization.city.id != params[:categ_id].to_i}
              @view_title = "Organisations situées vers " + City.find_by(id: params[:categ_id]).name
            end
          when "sectors"
            @sidebar_title = "Secteurs d'activité"
            ActivitySector.all.each { |sector| @sidebar_links.push( {id:sector.id, label:sector.name} ) }
            if params[:categ_id]
              @organizations = Organization.all.reject{|organization| organization.activity_sector.id != params[:categ_id].to_i}
              @view_title = ActivitySector.find_by(id: params[:categ_id]).name
            end
          when "status"
            @sidebar_title = "Status"
            Status.all.each { |status| @sidebar_links.push( {id:status.id, label:status.name} ) }
            if params[:categ_id]
              @organizations = Organization.all.reject{|organization| organization.status.id != params[:categ_id].to_i}
              @view_title = Status.find_by(id: params[:categ_id]).name
            end
        end
      end
    end
end
