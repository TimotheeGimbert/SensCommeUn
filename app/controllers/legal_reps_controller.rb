class LegalRepsController < ApplicationController
  before_action :set_legal_rep, only: %i[ show edit update destroy ]

  # GET /legal_reps or /legal_reps.json
  def index
    @legal_reps = LegalRep.all
  end

  # GET /legal_reps/1 or /legal_reps/1.json
  def show
  end

  # GET /legal_reps/new
  def new
    @legal_rep = LegalRep.new
  end

  # GET /legal_reps/1/edit
  def edit
  end

  # POST /legal_reps or /legal_reps.json
  def create
    @legal_rep = LegalRep.new(legal_rep_params)

    respond_to do |format|
      if @legal_rep.save
        format.html { redirect_to @legal_rep, notice: "Legal rep was successfully created." }
        format.json { render :show, status: :created, location: @legal_rep }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @legal_rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_reps/1 or /legal_reps/1.json
  def update
    respond_to do |format|
      if @legal_rep.update(legal_rep_params)
        format.html { redirect_to @legal_rep, notice: "Legal rep was successfully updated." }
        format.json { render :show, status: :ok, location: @legal_rep }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @legal_rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_reps/1 or /legal_reps/1.json
  def destroy
    @legal_rep.destroy
    respond_to do |format|
      format.html { redirect_to legal_reps_url, notice: "Legal rep was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_rep
      @legal_rep = LegalRep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def legal_rep_params
      params.require(:legal_rep).permit(:user_id, :organization_id, :start_date, :end_date)
    end
end
