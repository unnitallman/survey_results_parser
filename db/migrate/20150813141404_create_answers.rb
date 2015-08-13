class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :rating
      t.string  :single_select
      t.string  :type
      t.integer :question_id, :response_id
    end
  end
end
