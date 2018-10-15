class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.boolean :joy_enabled
      t.boolean :sadness_enabled
      t.boolean :anger_enabled
      t.boolean :fear_enabled
      t.boolean :surprise_enabled
      t.boolean :contempt_enabled
      t.boolean :disgust_enabled

      t.timestamps
    end
  end
end
