class AddLogsToFaceVideoAnalysis < ActiveRecord::Migration[5.2]
  def change
    add_column :face_video_analyses, :logs, :string, array: true, default: '{}'

  end
end
