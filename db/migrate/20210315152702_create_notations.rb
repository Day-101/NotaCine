class CreateNotations < ActiveRecord::Migration[6.1]
  def change
    create_table :notations do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :scenario
      t.integer :image
      t.integer :editing
      t.integer :sound
      t.integer :makeup
      t.integer :directing
      t.timestamps
    end
  end
end
