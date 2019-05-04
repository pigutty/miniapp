class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to controller: :messages, action: :index
  end

  def destroy
    message = Message.find(params[:id])
    if message.user_id == current_user.id
      message.destroy
    end
    redirect_to root_path
  end

  def edit
    @message = Message.find(id_params[:id])
  end

  def update
    message = Message.find(id_params[:id])
    message.update(message_params) if message.user_id == current_user.id
    redirect_to root_path
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def id_params
    params.permit(:id)
  end

end
