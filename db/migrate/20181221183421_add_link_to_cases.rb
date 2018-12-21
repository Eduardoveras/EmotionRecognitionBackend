class AddLinkToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :link, :string
  end
end
