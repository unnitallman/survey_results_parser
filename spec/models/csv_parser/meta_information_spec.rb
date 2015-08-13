require 'rails_helper'

describe CsvParser::MetaInformation do
  let(:csv_data) { open(Rails.root.join('example_data','example-1.csv')).read }

  it "should return data in the expected format" do
    expected_data = {
      0=> {
            :question=>"I like the kind of work I do.", 
            :question_type=>"ratingquestion", 
            :theme=>"The Work"
          }, 

      1=> {
            :question=>"In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective.", 
            :question_type=>"ratingquestion", 
            :theme=>"The Work"
          }, 

      2=> {
            :question=>"We are working at the right pace to meet our goals.", 
            :question_type=>"ratingquestion", 
            :theme=>"The Work"
          }, 

      3=> {
            :question=>"I feel empowered to get the work done for which I am responsible.", 
            :question_type=>"ratingquestion", 
            :theme=>"The Place"
          }, 

      4=> {
            :question=>"I am appropriately involved in decisions that affect my work.", 
            :question_type=>"ratingquestion", 
            :theme=>"The Place"
          }
    }

    expect(CsvParser::MetaInformation.new(csv_data).parse).to eq expected_data
  end
end