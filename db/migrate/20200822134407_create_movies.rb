class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :rat
      t.date :re
      t.string :gen
      t.integer :len
      t.text :des
      t.float :avg_score

      t.timestamps
    end
  end
end
