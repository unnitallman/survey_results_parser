class Response < ActiveRecord::Base
  has_many :answers
  has_many :single_select_answers
  has_many :rating_answers
end