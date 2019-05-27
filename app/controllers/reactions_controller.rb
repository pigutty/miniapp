class ReactionsController < ApplicationController
  before_action :set_user

  def create
    @reaction = Reaction.new(stamp_type: params[:stamp_type], user_id: params[:user_id], message_id: params[:message_id])
    if @reaction.save
      respond_to do |format|
        format.json
      end
    else
      @reactions = @message.reactions
      render :index
    end
  end

  private

  def reaction_params
    params.require(:reaction).permit(:stamp_type, :stamp_number).merge(message_id: params[:message_id], user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
    # @message = Message.find(params[:message_id])
  end
end
