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
      puts total_joy
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


  def positive_emotion
    frames = get_all_frames
    hash = JSON.parse frames
        .where("(emotions->>'joy')::float > -1")
        .select("AVG(emotions.id), AVG((emotions->>'joy')::float)").to_json
    final_thing = hash.first.deep_symbolize_keys
    final_thing[:avg]
  end

  def set_summary_data
    self.average_gender=get_average_gender
    self.average_age=get_average_age
    self.emotion_trend= positive_emotion
    self.dominant_emotion=""
    self.emotions_percentage = get_average_emotions
    #self.notable_moments
  end

  private

  def get_all_frames
    Emotion.where(video_id: id)
  end

end
