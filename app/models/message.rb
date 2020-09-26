class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  validates :content, presence: true

  after_create :broadcast_message



   def broadcast_message
    ActionCable.server.broadcast("channel_#{channel.name}", self)
  end
end
