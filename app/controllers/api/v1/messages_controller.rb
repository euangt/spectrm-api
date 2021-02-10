class Api::V1::MessagesController < Api::V1::BaseController
  before_action :set_message, only: [ :show ]
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def update
    if @message.update(message_params)
      render :show
    else
      render_error
    end
  end

  private 

  def message_params
    params.require(:message).permit(:id, :content)
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def render_error
    render json: { errors: @message.errors.full_messages },
      status: :unprocessable_entity
  end
end