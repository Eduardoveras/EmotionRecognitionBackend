class AddCriminialReferenceToFaceVideoAnalyses < ActiveRecord::Migration[5.2]
  def change
    add_reference :face_video_analyses, :criminal, index: true
  end
end
