class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user
      t.references :hunt

      t.timestamps
    end
  end
end
