class PrivateMessagesController < ApplicationController
  before_action :set_private_message, only: %i[ show edit update destroy ]
  before_action :has_user_rights?, only: %i[ index new show create ]
  before_action :has_admin_rights?, only: %i[ edit update destroy ]

  # GET /private_messages or /private_messages.json
  def index
    # Gets messages of the current user, then renders the appropriate partial
      @view_title = "Mes messages"
      if user_signed_in?
        @sent_messages = current_user.sent_messages
        @received_messages = current_user.received_messages
      elsif admin_signed_in?
        @sent_messages = current_admin.sent_messages
        @received_messages = current_admin.received_messages
      end
      @render_view = "private_messages/list"
  end

  # GET /private_messages/1 or /private_messages/1.json
  def show
    @view_title = "Message"
    @private_message = PrivateMessage.find_by(id: params[:id].to_i)
    @render_view = "private_messages/show"
  end

  # GET /private_messages/new
  def new
    @private_message = PrivateMessage.new
    @view_title = "Envoyer un message"
    @render_view = "private_messages/form"
    # if user_signed_in?
      # @private_message = PrivateMessage.new(author: current_user)

      # @private_message.author = current_user
    # elsif admin_signed_in?
      # @private_message = PrivateMessage.new(author: current_admin)
      # @private_message.author = current_admin
    # end
  end

  # GET /private_messages/1/edit
  def edit
  end

  # POST /private_messages or /private_messages.json
  def create
    @private_message = PrivateMessage.new(private_message_params)
    
    respond_to do |format|
      if @private_message.save
        # puts "it's working"
        # params[:recipients_user].each do |recipients_user|
        #   recipients_user = JoinMessagesRecipient.new(:recipients_user_id => recipients_user, :post_id => @private_message.id)
        #   if recipients_user.valid?
        #     recipients_user.save
        #   else
        #     @errors += recipients_user.errors
        #   end
        # end
        format.html { redirect_to @private_message, success: "Private message was successfully created." }
        format.json { render :show, status: :created, location: @private_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @private_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /private_messages/1 or /private_messages/1.json
  def update
    respond_to do |format|
      if @private_message.update(private_message_params)
        format.html { redirect_to @private_message, notice: "Private message was successfully updated." }
        format.json { render :show, status: :ok, location: @private_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @private_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_messages/1 or /private_messages/1.json
  def destroy
    @private_message.destroy
    respond_to do |format|
      format.html { redirect_to private_messages_url, notice: "Private message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_message
      @private_message = PrivateMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def private_message_params
      params.require(:private_message).permit(:object, :content, :author_id, :author_type, recipients_user_ids: [], recipients_admin_ids: [])
    end
end
