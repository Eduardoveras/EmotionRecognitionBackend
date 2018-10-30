class AddDurationToAnalysis < ActiveRecord::Migration[5.2]
  def change
    add_column :face_video_analyses, :duration, :text

  end
end
