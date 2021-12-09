class ExternalStakeholdersController < ApplicationController
  before_action :set_external_stakeholder, only: %i[ show edit update destroy ]

  # GET /external_stakeholders or /external_stakeholders.json
  def index
    @external_stakeholders = ExternalStakeholder.all
  end

  # GET /external_stakeholders/1 or /external_stakeholders/1.json
  def show
  end

  # GET /external_stakeholders/new
  def new
    @external_stakeholder = ExternalStakeholder.new
  end

  # GET /external_stakeholders/1/edit
  def edit
  end

  # POST /external_stakeholders or /external_stakeholders.json
  def create
    @external_stakeholder = ExternalStakeholder.new(external_stakeholder_params)

    respond_to do |format|
      if @external_stakeholder.save
        format.html { redirect_to @external_stakeholder, notice: "External stakeholder was successfully created." }
        format.json { render :show, status: :created, location: @external_stakeholder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external_stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_stakeholders/1 or /external_stakeholders/1.json
  def update
    respond_to do |format|
      if @external_stakeholder.update(external_stakeholder_params)
        format.html { redirect_to @external_stakeholder, notice: "External stakeholder was successfully updated." }
        format.json { render :show, status: :ok, location: @external_stakeholder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external_stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_stakeholders/1 or /external_stakeholders/1.json
  def destroy
    @external_stakeholder.destroy
    respond_to do |format|
      format.html { redirect_to external_stakeholders_url, notice: "External stakeholder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_stakeholder
      @external_stakeholder = ExternalStakeholder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def external_stakeholder_params
      params.require(:external_stakeholder).permit(:organization_id, :name, :email, :stakeholder_category_id)
    end
end
