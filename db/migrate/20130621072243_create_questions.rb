class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :user_id
      t.string :answer

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
