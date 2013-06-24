class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :hint
      t.integer :user_id
      t.string :answer
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4

      t.timestamps
    end
  end
end
