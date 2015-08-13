module CsvParser
  class Responses
    attr_reader :csv_rows

    def initialize(csv_data)
      @csv_rows = CSV.parse csv_data
    end

    def parse
      response_rows.map do |response_array|
        CsvParser::Response.new(response_array).parse
      end
    end

    private
    def response_rows
      csv_rows[3..-1]
    end
  end
end