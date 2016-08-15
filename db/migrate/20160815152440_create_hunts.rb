class CreateHunts < ActiveRecord::Migration[5.0]
  def change
    create_table :hunts do |t|
      t.string :name
      t.string :address
      t.integer :day_price
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
