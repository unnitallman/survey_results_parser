class SurveyResultsController < ApplicationController
  def index
    @surveys = Survey.all.order('created_at desc')
  end

  def show
    @survey = Survey.find(params[:id])
    @themes   = @survey.themes
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
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Survey deleted"
    redirect_to survey_results_path
  end
end
