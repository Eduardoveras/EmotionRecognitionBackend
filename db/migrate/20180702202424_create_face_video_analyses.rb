class CreateFaceVideoAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :face_video_analyses do |t|
      t.text :notes

      t.timestamps
    end
  end
end
