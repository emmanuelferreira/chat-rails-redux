module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
       stream_from "channel_#{params[:name]}"
     end

     def unsubscribed
       # Any cleanup needed when channel is unsubscribed
     end
  end
end
