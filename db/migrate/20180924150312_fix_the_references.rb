class FixTheReferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :cases, :face_video_analysis_id
    add_reference :face_video_analyses, :case, index: true

  end
end
