module CsvParser
  class Response
    attr_reader :response_array

    def initialize(response_array)
      @response_array = response_array
    end

    def parse
      {
        email: email,
        employee_id: employee_id,
        submitted_at: submitted_at,
        answers: answers_hash
      }
    end

    private
    def email
      response_array[0]
    end

    def employee_id
      response_array[1]
    end

    def submitted_at
      response_array[2]
    end

    def answers
      response_array[3..-1]
    end

    def answers_hash
      Hash[(0...answers.size).zip answers]
    end
  end
end