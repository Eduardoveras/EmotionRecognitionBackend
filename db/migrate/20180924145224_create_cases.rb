class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.references :face_video_analysis, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
