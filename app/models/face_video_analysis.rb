class FaceVideoAnalysis < ApplicationRecord
  #attr_accessor :enabled
  belongs_to :case, optional: true
  belongs_to :criminal, optional: true


  def get_average_gender
    frames = get_all_frames
    total_male = frames.where("appearance -> 'gender' ? :gender", gender: 'Male').count
    total_female = frames.where("appearance -> 'gender' ? :gender", gender: 'Female').count
    total_male > total_female ? "masculino" : "femenino"
  end

  def get_average_age
    frames = get_all_frames
    total_unknown = frames.where("appearance -> 'age' ? :age", age: 'Unknown').count
    total_25_to_34 = frames.where("appearance -> 'age' ? :age", age: '25 - 34').count
    total_35_to_44 = frames.where("appearance -> 'age' ? :age", age: '35 - 44').count

    max = [total_unknown, total_35_to_44, total_25_to_34].max
    if max == total_unknown
      'Unknown'
    elsif max == total_25_to_34
      '25 - 34'
    else
      '35 - 44'
    end
  end

  def get_average_emotions
    frames = get_all_frames
    total_joy=0
    total_fear=0
    total_anger=0
    total_disgust=0
    total_sadness=0
    total_valence=0
    total_contempt=0
    total_surprise=0
    total_engagement=0
    total_frames=frames.count
    frames.each do |frame|
      total_joy+= Float(frame.emotions['joy'])
      total_fear+= Float(frame.emotions['fear'])
      total_anger+= Float(frame.emotions['anger'])
      total_disgust+= Float(frame.emotions['disgust'])
      total_sadness+= Float(frame.emotions['sadness'])
      total_valence+= Float(frame.emotions['valence'])
      total_contempt+= Float(frame.emotions['contempt'])
      total_surprise+= Float(frame.emotions['surprise'])
      total_engagement+= Float(frame.emotions['engagement'])
    end

    case [total_joy,
          total_fear,
          total_anger,
          total_disgust,
          total_sadness,
          total_contempt,
          total_surprise].max
    when total_joy
      self.dominant_emotion="Felicidad"
    when total_fear
      self.dominant_emotion="Miedo"
    when total_anger
      self.dominant_emotion="Enojo"
    when total_disgust
      self.dominant_emotion="Disgusto"
    when total_sadness
      self.dominant_emotion="Tristeza"
    when total_contempt
      self.dominant_emotion="Desprecio"
    when total_surprise
      self.dominant_emotion="Sorpresa"
    else
      "You gave me #{x} -- I have no idea what to do with that."
    end

    case [total_joy,
          total_fear,
          total_anger,
          total_disgust,
          total_sadness,
          total_contempt,
          total_surprise].min
    when total_joy
      self.lesser_emotion="Felicidad"
    when total_fear
      self.lesser_emotion="Miedo"
    when total_anger
      self.lesser_emotion="Enojo"
    when total_disgust
      self.lesser_emotion="Disgusto"
    when total_sadness
      self.lesser_emotion="Tristeza"
    when total_contempt
      self.lesser_emotion="Desprecio"
    when total_surprise
      self.lesser_emotion="Sorpresa"
    else
      "You gave me #{x} -- I have no idea what to do with that."
    end

    if total_frames>0
      [(total_joy/total_frames).round(3),
       (total_fear/total_frames).round(3),
       (total_anger/total_frames).round(3),
       (total_disgust/total_frames).round(3),
       (total_sadness/total_frames).round(3),
       (total_valence/total_frames).round(3),
       (total_contempt/total_frames).round(3),
       (total_surprise/total_frames).round(3),
       (total_engagement/total_frames).round(3)]
    else
      []

    end


  end

  def get_notable_moments
    frames = get_all_frames
    main_emotions=[]
    current_emotions=[]
    self.notable_moments=[]
    frames.each do |frame|

      main_emotions= [Float(frame.emotions['joy']),
      Float(frame.emotions['fear']), Float(frame.emotions['anger']),
      Float(frame.emotions['disgust']), Float(frame.emotions['sadness']),
      Float(frame.emotions['valence']), Float(frame.emotions['contempt']),
      Float(frame.emotions['surprise']), Float(frame.emotions['engagement'])].sort.last(2)



      if main_emotions[0]>30 and main_emotions[1] >30
      working_emotion=[]
      main_emotions.each do |emotion|

        if emotion == Float(frame.emotions['fear'])
          working_emotion.push('fear')
        end
        if emotion == Float(frame.emotions['anger'])
          working_emotion.push('anger')
        end
        if emotion == Float(frame.emotions['disgust'])
          working_emotion.push('disgust')
        end
        if emotion == Float(frame.emotions['sadness'])
          working_emotion.push('sadness')
        end
        if emotion == Float(frame.emotions['joy'])
          working_emotion.push('joy')
        end
        if emotion == Float(frame.emotions['contempt'])
          working_emotion.push('contempt')
        end
        if emotion == Float(frame.emotions['surprise'])
          working_emotion.push('surprise')
        end
      end

      if current_emotions != working_emotion
        self.notable_moments.push("Se detectaron multiples emociones dominantes en "+Time.at(frame.timeStamp).strftime("%M:%S "))
      end
      current_emotions=working_emotion




      end


    end

  end



  def positive_emotion
    frames = get_all_frames
    total_positive=0
    total_negative=0
    total_frames=frames.count
    frames.each do |frame|
      total_positive+= Float(frame.emotions['joy'])
      total_negative+= Float(frame.emotions['fear'])
      total_negative+= Float(frame.emotions['anger'])
      total_negative+= Float(frame.emotions['disgust'])
      total_negative+= Float(frame.emotions['sadness'])
      total_negative+= Float(frame.emotions['contempt'])
      total_positive+= Float(frame.emotions['surprise'])
    end
    if total_frames>0
      (total_positive)/(total_negative)
    else
      ""

    end
  end

  def get_duration
    if get_all_frames.count >0
      get_all_frames.last.timeStamp
    else
      0
    end
  end

  def set_summary_data
    self.average_gender=get_average_gender
    self.average_age=get_average_age
    self.emotion_trend= positive_emotion
    self.emotions_percentage = get_average_emotions
    get_notable_moments

    if get_duration >0
      self.duration= get_duration
    else
      self.destroy!
    end

  end

  private

  def get_all_frames
    Emotion.where(video_id: id)
  end

end
