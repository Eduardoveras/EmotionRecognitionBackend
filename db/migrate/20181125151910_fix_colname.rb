class FixColname < ActiveRecord::Migration[5.2]
  def change
    rename_column :markers, :note, :text

  end
end
