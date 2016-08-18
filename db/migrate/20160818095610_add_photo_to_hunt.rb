class AddPhotoToHunt < ActiveRecord::Migration[5.0]
  def change
    add_column :hunts, :photo, :string
  end
end
