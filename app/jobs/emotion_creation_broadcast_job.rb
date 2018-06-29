class ChatMessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(emotion)
    ActionCable
        .server
        .broadcast('emotion_channel',
                   id: emotion.id,
                   created_at: emotion.created_at.strftime('%H:%M'),
                   appearance: emotion.appearance,
                   timeStamp: emotion.timeStamp,
                   facesCount: emotion.facesCount,
                   emotions: emotion.emotions,
                   expressions: emotion.expressions)
  end
end