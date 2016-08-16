class AddDescriptionToHunt < ActiveRecord::Migration[5.0]
  def change
    add_column :hunts, :description, :text
  end
end
