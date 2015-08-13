class RatingQuestion < Question
  def average_score
    (answers.sum(:rating)/participants_count.to_f).round(2)
  end

  private
  
  def participants_count
    theme.csv_file.participants_count
  end

end