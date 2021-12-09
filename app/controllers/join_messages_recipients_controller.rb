class JoinMessagesRecipientsController < ApplicationController
  before_action :set_join_messages_recipient, only: %i[ show edit update destroy ]

  # GET /join_messages_recipients or /join_messages_recipients.json
  def index
    @join_messages_recipients = JoinMessagesRecipient.all
  end

  # GET /join_messages_recipients/1 or /join_messages_recipients/1.json
  def show
  end

  # GET /join_messages_recipients/new
  def new
    @join_messages_recipient = JoinMessagesRecipient.new
  end

  # GET /join_messages_recipients/1/edit
  def edit
  end

  # POST /join_messages_recipients or /join_messages_recipients.json
  def create
    @join_messages_recipient = JoinMessagesRecipient.new(join_messages_recipient_params)

    respond_to do |format|
      if @join_messages_recipient.save
        format.html { redirect_to @join_messages_recipient, notice: "Join messages recipient was successfully created." }
        format.json { render :show, status: :created, location: @join_messages_recipient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @join_messages_recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_messages_recipients/1 or /join_messages_recipients/1.json
  def update
    respond_to do |format|
      if @join_messages_recipient.update(join_messages_recipient_params)
        format.html { redirect_to @join_messages_recipient, notice: "Join messages recipient was successfully updated." }
        format.json { render :show, status: :ok, location: @join_messages_recipient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @join_messages_recipient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_messages_recipients/1 or /join_messages_recipients/1.json
  def destroy
    @join_messages_recipient.destroy
    respond_to do |format|
      format.html { redirect_to join_messages_recipients_url, notice: "Join messages recipient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_messages_recipient
      @join_messages_recipient = JoinMessagesRecipient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def join_messages_recipient_params
      params.require(:join_messages_recipient).permit(:private_message_id, :recipient_id, :recipient_type)
    end
end
