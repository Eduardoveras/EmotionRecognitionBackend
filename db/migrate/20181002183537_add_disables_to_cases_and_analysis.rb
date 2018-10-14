class AddDisablesToCasesAndAnalysis < ActiveRecord::Migration[5.2]
  def change
    add_column :face_video_analyses, :enabled, :boolean, :default => true
    add_column :cases, :enabled, :boolean, :default => true
  end
end
