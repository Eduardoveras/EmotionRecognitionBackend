class AddVideoRecordingToFaceVideoAnalyses < ActiveRecord::Migration[5.2]
  def change
    add_column :face_video_analyses, :video_base64, :text
  end
end
