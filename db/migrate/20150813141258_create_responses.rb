class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer  :employee_id
      t.datetime :submitted_at
      t.string   :email
      t.integer  :survey_id
    end
  end
end
