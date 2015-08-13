require 'csv'

module CsvParser
  class Main
    def initialize(file)
      csv_data          = file.read
      @csv_filename     = file.original_filename
      @meta_information = CsvParser::MetaInformation.new(csv_data).parse
      @responses        = CsvParser::Responses.new(csv_data).parse
    end

    def load
      ActiveRecord::Base.transaction do
        create_csv_file
        load_meta_information
        load_responses
      end
    end

    private

    def create_csv_file
      @csv_file = CsvFile.create name: @csv_filename
    end

    def load_meta_information
      @meta_information.keys.each do |index|
        q = @meta_information[index]

        theme    = @csv_file.themes.where(name: q[:theme]).first_or_create
        question = theme.questions.where(question_text: q[:question], type: question_type_selector(q[:question_type])).first_or_create
        @meta_information[index][:question_id] = question.id
      end
    end

    def load_responses
      @responses.each do |r|
        response = @csv_file.responses.create(email: r[:email], employee_id: r[:employee_id], submitted_at: r[:submitted_at])
        answers = r[:answers]
        answers.keys.each do |i|
          question_id = @meta_information[i][:question_id]
          response.answers.create(question_id: question_id, rating: answers[i], type: answer_type_selector(@meta_information[i][:question_type])  )
        end
      end
    end

    def question_type_selector(question_type)
      {
        'ratingquestion' => 'RatingQuestion',
        'singleselect'  => 'SingleSelectQuestion'
      }[question_type]
    end

    def answer_type_selector(question_type)
      {
        'ratingquestion' => 'RatingAnswer',
        'singleselect'  => 'SingleSelectAnswer'
      }[question_type]
    end

  end
end