class CreateCriminals < ActiveRecord::Migration[5.2]
  def change
    create_table :criminals do |t|
      t.string :name

      t.timestamps
    end
  end
end
