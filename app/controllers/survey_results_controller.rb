class SurveyResultsController < ApplicationController
  def index
    @csv_files = CsvFile.all.order('created_at desc')
  end

  def show
    @csv_file = CsvFile.find(params[:id])
    @themes   = @csv_file.themes
  end

  def create
    begin
      CsvParser::Main.new(params[:file]).load
    rescue
      flash[:error] = "Invalid file"
    else
      flash[:notice] = "Survey imported"
    end
    redirect_to survey_results_path
  end

  def destroy
    @csv_file = CsvFile.find(params[:id])
    @csv_file.destroy
    flash[:notice] = "Survey deleted"
    redirect_to survey_results_path
  end
end
