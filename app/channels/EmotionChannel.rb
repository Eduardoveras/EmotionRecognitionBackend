class EmotionChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def unsubscribed; end

  def create(opts)
    Emotion.create(
      timeStamp: opts.fetch('timeStamp'),
      facesCount: opts.fetch('facesCount'),
      appearence: opts.fetch('appearence'),
      emotions: opts.fetch('emotions'),
      expressions: opts.fetch('expressions')
    )
  end
end
