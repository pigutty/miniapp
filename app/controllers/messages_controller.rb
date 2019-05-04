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
  end

  def update
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
