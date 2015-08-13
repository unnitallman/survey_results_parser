class Theme < ActiveRecord::Base
  has_many :questions,  dependent: :destroy
  has_many :rating_questions
  has_many :single_select_questions

  belongs_to :csv_file
end