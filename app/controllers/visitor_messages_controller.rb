class VisitorMessagesController < ApplicationController
  before_action :set_visitor_message, only: %i[ show edit update destroy ]
  before_action :has_admin_rights?, only: %i[ index show edit update destroy ]


  # GET /visitor_messages or /visitor_messages.json
  def index
    @visitor_messages = VisitorMessage.all
  end

  # GET /visitor_messages/1 or /visitor_messages/1.json
  def show
  end

  # GET /visitor_messages/new
  def new
    @visitor_message = VisitorMessage.new
  end

  # GET /visitor_messages/1/edit
  def edit
  end

  # POST /visitor_messages or /visitor_messages.json
  def create
    @visitor_message = VisitorMessage.new(visitor_message_params)

    respond_to do |format|
      if @visitor_message.save
        format.html { redirect_to root_path, success: "Votre message a bien été envoyé" }
        format.json { render :show, status: :created, location: @visitor_message }
      else
        format.html { render pages_contact_path, status: :unprocessable_entity }
        format.json { render json: @visitor_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitor_messages/1 or /visitor_messages/1.json
  def update
    respond_to do |format|
      if @visitor_message.update(visitor_message_params)
        format.html { redirect_to @visitor_message, success: "Votre message a bien été envoyé" }
        format.json { render :show, status: :ok, location: @visitor_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitor_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitor_messages/1 or /visitor_messages/1.json
  def destroy
    @visitor_message.destroy
    respond_to do |format|
      format.html { redirect_to visitor_messages_url, success: "Visitor message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_message
      @visitor_message = VisitorMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitor_message_params
      params.require(:visitor_message).permit(:email, :message)
    end
end
