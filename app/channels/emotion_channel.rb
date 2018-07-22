class EmotionChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'emotion_channel'
  end

  def unsubscribed; end

  def create(opts)
    Emotion.create(
      video_id: opts.fetch('video_id'),
      timeStamp: opts.fetch('timeStamp'),
      facesCount: opts.fetch('facesCount'),
      appearance: opts.fetch('appearance'),
      emotions: opts.fetch('emotions'),
      expressions: opts.fetch('expressions'),
      measurements: opts.fetch('measurements'),
      featurePoints: opts.fetch('featurePoints')
    )
  end
end
