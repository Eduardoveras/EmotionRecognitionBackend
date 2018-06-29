class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.decimal :timeStamp
      t.integer :facesCount
      t.jsonb :appearance
      t.jsonb :emotions
      t.jsonb :expressions

      t.timestamps
    end
  end
end
