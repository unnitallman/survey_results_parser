class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :question_text
      t.integer :theme_id
      t.string  :type
    end
  end
end
