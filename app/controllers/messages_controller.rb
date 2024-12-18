class MessagesController < ApplicationController
    def create
        @order = Order.find(params[:order_id])
        @message = @order.messages.build(message_params.merge(user: current_user))

      if current_user.is_doctor?
        @message.doctor = current_user
      else
        @message.user = current_user
      end
      if @message.save
        Turbo::StreamsChannel.broadcast_append_to(
          "messages_order_#{@order.id}",
          target: "messages",
          partial: "messages/message", 
          locals: { message: @message }
        )
        head :ok
      else
        render :new
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:message, :order_id, :user_id)
    end
  end