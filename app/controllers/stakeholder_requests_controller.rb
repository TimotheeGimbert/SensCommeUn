class StakeholderRequestsController < ApplicationController
  before_action :set_stakeholder_request, only: %i[ show edit update destroy ]
  before_action :has_user_rights?, only: %i[ create update]
  before_action :is_user_recipient_manager?, only: %i[edit update destroy]
  
  # GET /stakeholder_requests or /stakeholder_requests.json
  def index
    @stakeholder_requests = StakeholderRequest.all
  end

  # GET /stakeholder_requests/1 or /stakeholder_requests/1.json
  def show
  end

  # GET /stakeholder_requests/new
  def new
    @stakeholder_request = StakeholderRequest.new
  end

  # GET /stakeholder_requests/1/edit
  def edit
  end

  # POST /stakeholder_requests or /stakeholder_requests.json
  def create
    @stakeholder_request = StakeholderRequest.new(stakeholder_request_params)
    @stakeholder_request.user = current_user
    @stakeholder_request.validation = 0
    respond_to do |format|
        if @stakeholder_request.save
          format.html { redirect_to organization_path(id:@stakeholder_request.organization.id ,organization_managed_id: @stakeholder_request.organization.id), success: "Stakeholder request was successfully created." }
          format.json { render :show, status: :created, location: @stakeholder_request }
        else
          format.html { redirect_to organization_path(id: @stakeholder_request.organization.id , organization_managed_id: @stakeholder_request.organization.id), danger: "Stakeholder request was denied."}
          format.json { render json: @stakeholder_request.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /stakeholder_requests/1 or /stakeholder_requests/1.json
  def update
    stakeholder_category_id = stakeholder_request_params[:stakeholder_category].to_i
    if stakeholder_category_id == 0
      stakeholder_category_id = StakeholderCategory.find_by(name:"non déterminé").id
    end
    stakeholder_request_params.delete("stakeholder_category") 
    respond_to do |format|
      if @stakeholder_request.update(stakeholder_request_params)
        
        ExternalStakeholder.create(user:@stakeholder_request.user, email: @stakeholder_request.user.email, stakeholder_category_id: stakeholder_category_id, organization: @stakeholder_request.organization)

        format.html {redirect_to external_stakeholders_path(organization_managed_id: @stakeholder_request.organization.id), success: "Stakeholder request was successfully updated." }
        format.json { render :show, status: :ok, location: @stakeholder_request }
      else
        format.html { redirect_to  external_stakeholders_path(organization_managed_id: @stakeholder_request.organization.id), status: :unprocessable_entity }
        format.json { render json: @stakeholder_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stakeholder_requests/1 or /stakeholder_requests/1.json
  def destroy
    organization_id = @stakeholder_request.organization.id
    @stakeholder_request.destroy
    respond_to do |format|
      format.html { redirect_to organization_path(organization_managed_id: @stakeholder_request.organization.id), success: "Stakeholder request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stakeholder_request
      @stakeholder_request = StakeholderRequest.find(params[:id].to_i)
    end

    # Only allow a list of trusted parameters through.
    def stakeholder_request_params
      organization_id = params[:stakeholder_request][:organization_id]
      if current_user.managed_organizations.include?(Organization.find_by(id: organization_id.to_i))
        params.require(:stakeholder_request).permit(:validation, :organization_id,:stakeholder_category )
      else
        params.require(:stakeholder_request).permit(:message, :organization_id)
      end
    end

    def is_user_recipient_manager?
      redirect_back fallback_location: root_path unless @stakeholder_request.organization.managers.include?(current_user)
    end
end
