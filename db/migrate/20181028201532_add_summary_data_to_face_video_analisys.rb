class AddSummaryDataToFaceVideoAnalisys < ActiveRecord::Migration[5.2]
  def change
    add_column :face_video_analyses, :average_age, :text #perceived age
    add_column :face_video_analyses, :average_gender, :text #perceiverd gender
    add_column :face_video_analyses, :dominant_emotion, :text #single dominant emotion
    add_column :face_video_analyses, :lesser_emotion, :text #single lesser emotion
    add_column :face_video_analyses, :emotion_trend, :text #negative or positive
    add_column :face_video_analyses, :emotions_percentage, :text, array: true, default: []
    add_column :face_video_analyses, :notable_moments, :text, array: true, default: []
  end
end
