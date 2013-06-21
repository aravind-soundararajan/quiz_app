class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :answer
      t.string :hint
      t.integer :user_id

      t.timestamps
    end
      add_index :scores, :user_id
  end
end
