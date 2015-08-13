class SurveyResultsController < ApplicationController
  def index
    @csv_files = CsvFile.all.order('created_at desc')
  end

  def show
    @csv_file = CsvFile.find(params[:id])
    @themes   = @csv_file.themes
  end

  def create
    CsvParser::Main.new(params[:file]).load
    redirect_to survey_results_path
  end
end
