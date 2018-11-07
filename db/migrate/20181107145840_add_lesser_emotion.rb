class AddLesserEmotion < ActiveRecord::Migration[5.2]
  def change
    add_column :face_video_analyses, :lesser_emotion, :text #single lesser emotion
  end
end
