class AddRatingToFaceVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :face_video_analyses, :rating, :string

  end
end
