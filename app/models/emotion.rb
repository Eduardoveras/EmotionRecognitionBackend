class Emotion < ApplicationRecord
  after_create_commit do
    EmotionCreationBroadcastJob.perform_later(self)
  end
end
