module CsvParser
  class MetaInformation
    attr_reader :csv_rows

    def initialize(csv_data)
      @csv_rows = CSV.parse csv_data
    end

    def parse
      meta_information = {}
      
      questions.each_with_index do |question, i|
        meta_information[i] = {
          question: questions[i],
          question_type: question_types[i],
          theme: themes[i]
        }
      end

      meta_information
    end

    private
    def question_types
      csv_rows[0].compact
    end

    def questions
      csv_rows[2][3..-1]
    end

    def themes
      csv_rows[1].compact
    end
  end
end