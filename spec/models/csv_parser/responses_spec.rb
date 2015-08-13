require 'rails_helper'

describe CsvParser::Responses do
  let(:csv_data) { open(Rails.root.join('example_data','example-1.csv')).read }

  it "should return data in the expected format" do
    expected_data = [
      {
        :email=>"employee1@abc.xyz", 
        :employee_id=>"1", 
        :submitted_at=>"2014-07-28T20:35:41+00:00", 
        :answers=>{0=>"5", 1=>"5", 2=>"5", 3=>"4", 4=>"4"}
      },

      {
        :email=>nil, 
        :employee_id=>"2", 
        :submitted_at=>"2014-07-29T07:05:41+00:00", 
        :answers=>{0=>"4", 1=>"5", 2=>"5", 3=>"3", 4=>"3"}
      }, 
      
      {
        :email=>nil, 
        :employee_id=>"3", 
        :submitted_at=>"2014-07-29T17:35:41+00:00", 
        :answers=>{0=>"5", 1=>"5", 2=>"5", 3=>"5", 4=>"4"}
      }, 
      
      {
        :email=>"employee4@abc.xyz", 
        :employee_id=>"4", 
        :submitted_at=>"2014-07-30T04:05:41+00:00", 
        :answers=>{0=>"5", 1=>"5", 2=>"5", 3=>"4", 4=>"4"}
      }, 
      
      {
        :email=>nil, 
        :employee_id=>"5", 
        :submitted_at=>"2014-07-31T11:35:41+00:00", 
        :answers=>{0=>"4", 1=>"5", 2=>"5", 3=>"2", 4=>"3"}
      }, 
      
      {
        :email=>"employee5@abc.xyz", 
        :employee_id=>"6", 
        :submitted_at=>nil, 
        :answers=>{0=>nil, 1=>nil, 2=>nil, 3=>nil, 4=>nil}
      }
    ]
    
    expect(CsvParser::Responses.new(csv_data).parse).to eq expected_data
  end
end