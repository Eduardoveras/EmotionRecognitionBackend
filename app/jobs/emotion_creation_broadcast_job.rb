class ChatMessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(emotion)
    ActionCable
        .server
        .broadcast('emotion_channel',
                   id: emotion.id,
                   created_at: emotion.created_at.strftime('%H:%M'),
                   appearance: JSON.parse(emotion.appearance),
                   timeStamp: emotion.timeStamp,
                   facesCount: emotion.facesCount,
                   emotions: JSON.parse(emotion.emotions),
                   expressions: JSON.parse(emotion.expressions))
  end
end