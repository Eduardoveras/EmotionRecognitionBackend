class FaceVideoAnalysis < ApplicationRecord

  def average_gender
    frames = get_all_frames
    total_male = frames.where("appearance -> 'gender' ? :gender", gender: 'Male').count
    total_female = frames.where("appearance -> 'gender' ? :gender", gender: 'Female').count
    total_male > total_female ? "Male" : "Female"
  end

  def average_age
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

  private

  def get_all_frames
    Emotion.where(video_id: id)
  end

end