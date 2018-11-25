class CreateMarkers < ActiveRecord::Migration[5.2]
  def change
    create_table :markers do |t|
      t.text :note
      t.decimal :time
      t.references :face_video_analysis, foreign_key: true

      t.timestamps
    end
  end
end
