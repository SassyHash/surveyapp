class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :poll_id
      t.text :question_text

      t.timestamps
    end
  end
end