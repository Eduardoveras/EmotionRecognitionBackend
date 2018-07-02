class AddVideoIdToEmotions < ActiveRecord::Migration[5.2]
  def change
    add_column :emotions, :video_id, :string
  end
end
