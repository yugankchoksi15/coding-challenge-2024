class MessagesChannel < ApplicationCable::Channel
    def subscribed
      # Subscribe to a specific order's messages stream
      stream_for "messages_order_#{params[:order_id]}"
    end
  
    def unsubscribed
      # Any cleanup when channel is unsubscribed
    end
  end
  