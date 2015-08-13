class CsvFile < ActiveRecord::Base
  has_many :themes, dependent: :destroy
  has_many :responses, dependent: :destroy
  
  def participants_count
    responses.count
  end

  def complete_responses
    responses.select{|response| response.answers.map(&:answered?).any?}
  end

  def responded_participants_count
    complete_responses.size
  end

  def response_rate
    ((responded_participants_count/participants_count.to_f) * 100).to_i
  end
end