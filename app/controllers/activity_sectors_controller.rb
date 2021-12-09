class ActivitySectorsController < ApplicationController
  before_action :set_activity_sector, only: %i[ show edit update destroy ]

  # GET /activity_sectors or /activity_sectors.json
  def index
    @activity_sectors = ActivitySector.all
  end

  # GET /activity_sectors/1 or /activity_sectors/1.json
  def show
  end

  # GET /activity_sectors/new
  def new
    @activity_sector = ActivitySector.new
  end

  # GET /activity_sectors/1/edit
  def edit
  end

  # POST /activity_sectors or /activity_sectors.json
  def create
    @activity_sector = ActivitySector.new(activity_sector_params)

    respond_to do |format|
      if @activity_sector.save
        format.html { redirect_to @activity_sector, notice: "Activity sector was successfully created." }
        format.json { render :show, status: :created, location: @activity_sector }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity_sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_sectors/1 or /activity_sectors/1.json
  def update
    respond_to do |format|
      if @activity_sector.update(activity_sector_params)
        format.html { redirect_to @activity_sector, notice: "Activity sector was successfully updated." }
        format.json { render :show, status: :ok, location: @activity_sector }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity_sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_sectors/1 or /activity_sectors/1.json
  def destroy
    @activity_sector.destroy
    respond_to do |format|
      format.html { redirect_to activity_sectors_url, notice: "Activity sector was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_sector
      @activity_sector = ActivitySector.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_sector_params
      params.require(:activity_sector).permit(:name)
    end
end
