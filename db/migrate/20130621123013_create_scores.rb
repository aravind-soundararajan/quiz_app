class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :mark

      t.timestamps
    end
    add_index :scores, :user_id
  end
end
