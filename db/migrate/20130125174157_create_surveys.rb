class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
